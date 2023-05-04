using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace FOODIVE.Restaurant
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //Restro@123
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string selemail = "select resmng_id from restro where email = @Email union select resmng_id from sub_restro where email = @Email";
                SqlCommand cmd1 = new SqlCommand(selemail, con);
                cmd1.Parameters.AddWithValue("@Email", txtUsername.Text);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    string select = "select password from restro_manager where resmng_id = @ResmngId";
                    SqlCommand cmd = new SqlCommand(select, con);
                    cmd.Parameters.AddWithValue("@ResmngId", dr1["resmng_id"].ToString());
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        string inputtedPassword = txtpass.Text;
                        string storedHashedPassword = dr["password"].ToString();
                        string storedSalt = "mySalt";

                        string saltedPassword = string.Concat(inputtedPassword, storedSalt);
                        SHA256 sha256 = SHA256.Create();
                        byte[] saltedPasswordBytes = Encoding.UTF8.GetBytes(saltedPassword);
                        byte[] hashedPasswordBytes = sha256.ComputeHash(saltedPasswordBytes);
                        string hashedPassword = Convert.ToBase64String(hashedPasswordBytes);

                        if (hashedPassword == storedHashedPassword)
                        {
                            SqlCommand cmd5 = new SqlCommand("select rest_id from restro where email='" + txtUsername.Text + "'", con);
                            SqlDataReader dr5 = cmd5.ExecuteReader();
                            if (dr5.HasRows)
                            {
                                if (dr5.Read())
                                {
                                    Session["rest_id"] = dr5["rest_id"].ToString();
                                    Session["resmngid"] = dr1["resmng_id"];
                                    Response.Redirect("dashboard.aspx");
                                }
                            }

                            SqlCommand cmd6 = new SqlCommand("select subrest_id, rest_id from sub_restro where email='" + txtUsername.Text + "'", con);
                            SqlDataReader dr7 = cmd6.ExecuteReader();
                            if (dr7.HasRows)
                            {
                                if (dr7.Read())
                                {
                                    Session["rest_id"] = dr7["rest_id"].ToString();
                                    Session["subrest_id"] = dr7["subrest_id"].ToString();
                                    Session["resmngid"] = dr1["resmng_id"];
                                    Response.Redirect("/SubRestro/dashboard.aspx");
                                }
                            }
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Credential!')</script>");
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Credential!')</script>");
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Credential!')</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('An error occurred: " + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}
