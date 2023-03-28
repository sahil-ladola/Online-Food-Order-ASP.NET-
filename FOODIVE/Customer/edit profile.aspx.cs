using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace FOODIVE.Customer
{
    public partial class edit_profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lbluser.Text = Session["username"].ToString();
                con.Open();
                string select = "select * from register where email = @email";
                SqlCommand result = new SqlCommand(select, con);
                result.Parameters.AddWithValue("@email", Session["email"]);
                SqlDataReader dr = result.ExecuteReader();
                if (dr.Read())
                {
                    Username.Text = Session["username"].ToString();
                    txtFirstName.Text = dr["fname"].ToString();
                    txtLastName.Text = dr["lname"].ToString();
                    txtMobileNumber.Text = dr["mobile_num"].ToString();
                    txtAddress.Text = dr["address"].ToString();
                    txtEmail.Text = dr["email"].ToString();
                    txtCity.Text = dr["city"].ToString();
                    txtPincode.Text = dr["pincode"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void SaveProfile_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate("SaveProfile");
                con.Open();
                string update = "update register set fname = @fname, lname = @lname, mobile_num = @mobile_num, address = @address, email = @email, city = @city, pincode = @pincode where r_id = @r_id";
                SqlCommand com = new SqlCommand(update, con);
                com.Parameters.AddWithValue("@fname", txtFirstName.Text);
                com.Parameters.AddWithValue("@lname", txtLastName.Text);
                com.Parameters.AddWithValue("@mobile_num", txtMobileNumber.Text);
                com.Parameters.AddWithValue("@address", txtAddress.Text);
                com.Parameters.AddWithValue("@email", txtEmail.Text);
                com.Parameters.AddWithValue("@city", txtCity.Text);
                com.Parameters.AddWithValue("@pincode", txtPincode.Text);
                com.Parameters.AddWithValue("@r_id", Session["rid"]);
                if (com.ExecuteNonQuery() != 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Profile Updated Successfully !!!')</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Failed to update profile.')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate("ChangePassword");
                con.Open();
                string select = "select * from register where email = @email";
                SqlCommand result = new SqlCommand(select, con);
                result.Parameters.AddWithValue("@email", Session["email"]);
                SqlDataReader reader = result.ExecuteReader();
                if (reader.Read())
                {
                    if (txtOldPassword.Text == reader["password"].ToString())
                    {
                        string pass = "update register set password = @newPassword where email = @email";
                        SqlCommand com = new SqlCommand(pass, con);
                        com.Parameters.AddWithValue("@newPassword", txtNewPassword.Text);
                        com.Parameters.AddWithValue("@email", Session["email"]);

                        try
                        {
                            if (com.ExecuteNonQuery() != 0)
                            {
                                Response.Redirect("Login.aspx");
                            }
                        }
                        catch (SqlException ex)
                        {
                            if (ex.Number == 2627)
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('The email is already taken. Please choose a different email.')</script>");
                            }
                            else
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('An error occurred while updating your password. Please try again later.')</script>");
                            }
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Old password!')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}

           