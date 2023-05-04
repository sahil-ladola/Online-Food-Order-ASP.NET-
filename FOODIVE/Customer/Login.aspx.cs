using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace FOODIVE
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (IsPostBack)
            {
                if (ViewState["txtEmail"] != null)
                {
                    txtEmail.Text = ViewState["txtEmail"].ToString();
                }
                if (ViewState["txtPassword"] != null)
                {
                    txtPassword.Text = ViewState["txtPassword"].ToString();
                }
            }
            if (!IsPostBack)
            {
                if (Request.Cookies["email"] != null && Request.Cookies["pass"] != null)
                {
                    txtEmail.Text = Request.Cookies["email"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["pass"].Value;
                }
            }
            con.Close();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            //S@hil123
            ViewState["txtEmail"] = txtEmail.Text;
            ViewState["txtPassword"] = txtPassword.Text;
            con.Open();
            string select = "select fname , lname , email , password , r_id from register where email = '" + txtEmail.Text+"'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                string inputtedPassword = txtPassword.Text;
                string storedHashedPassword = dr["password"].ToString();
                string storedSalt = "mySalt";

                string saltedPassword = string.Concat(inputtedPassword, storedSalt);
                SHA256 sha256 = SHA256.Create();
                byte[] saltedPasswordBytes = Encoding.UTF8.GetBytes(saltedPassword);
                byte[] hashedPasswordBytes = sha256.ComputeHash(saltedPasswordBytes);
                string hashedPassword = Convert.ToBase64String(hashedPasswordBytes);
                if (hashedPassword == storedHashedPassword)
                {
                    if (chkRememberme.Checked)
                    {
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["pass"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["pass"].Expires = DateTime.Now.AddDays(-1);
                    }
                    Response.Cookies["email"].Value = txtEmail.Text.Trim();
                    Response.Cookies["pass"].Value = txtPassword.Text.Trim();
                    Session["rid"] = dr["r_id"];
                    Session["login"] = "login";
                    Session["email"] = dr["email"];
                    Session["username"] = dr["fname"] + " " + dr["lname"];
                    Response.Redirect("afterlogin.aspx");
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
            dr.Close();
            con.Close();
        }
    }
}