using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Visitor
{
    public partial class OTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["txtEmail"] == null)
            {
                Response.Redirect("~/Customer/Register.aspx");
            }
            else
            {
                email.Text = Session["txtEmail"].ToString();
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            try
            {
                int regOtp = Convert.ToInt32(Session["RegOTP"]);
                int userOtp = Convert.ToInt32(txtRegOtp.Text);

                if (userOtp == regOtp)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string query = "INSERT INTO register (fname, lname, mobile_num, address, city, pincode, email, password) VALUES (@fname, @lname, @mobile_num, @address, @city, @pincode, @email, @password)";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@fname", Session["txtFname"]);
                            command.Parameters.AddWithValue("@lname", Session["txtLname"]);
                            command.Parameters.AddWithValue("@mobile_num", Session["txtMobileNum"]);
                            command.Parameters.AddWithValue("@address", Session["txtAddress"]);
                            command.Parameters.AddWithValue("@city", Session["txtCity"]);
                            command.Parameters.AddWithValue("@pincode", Session["txtPincode"]);
                            command.Parameters.AddWithValue("@email", Session["txtEmail"]);
                            command.Parameters.AddWithValue("@password", "HashedPasswordGoesHere");

                            command.ExecuteNonQuery();
                        }
                    }
                    Response.Redirect("~/Customer/Login.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid OTP. Please try again.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred while processing your request. Please try again later.');", true);
            }
        }
    }
}
