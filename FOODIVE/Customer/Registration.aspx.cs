using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace FOODIVE
{
    public partial class Registration : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                const string select = "SELECT * FROM register WHERE email=@Email";
                using (SqlCommand cmd = new SqlCommand(select, connection))
                {
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Email is already taken.')</script>");
                            return;
                        }
                    }
                }
            }

            Session["txtEmail"] = txtEmail.Text;
            Session["txtCity"] = txtCity.Text;
            Session["txtAddress"] = txtAddress.Text;
            Session["txtPincode"] = txtPincode.Text;
            Session["txtPassword"] = txtPassword.Text;
            Session["txtMobileNum"] = txtMobileNum.Text;
            Session["txtLname"] = txtLname.Text;
            Session["txtFname"] = txtFname.Text;

            var random = new Random();
            var sendOtp = random.Next(100000, 999999);

            var toEmail = txtEmail.Text;
            var username = $"{txtFname.Text} {txtLname.Text}";
            var emailBody = $"Dear <b>{username}</b>,<br><br>Thank you for registering with FOODIVE Online Food Order System!<br><br>Here is your One Time Password for Registration: <b><u>{sendOtp}</u></b>. Please use this OTP to complete your registration process.<br><br>Thank you for choosing FOODIVE Online Food Order System. We look forward to serving you!<br><br>Best regards,<br>FOODIVE Team.";

            using (MailMessage mm = new MailMessage("foodiveonline@gmail.com", toEmail))
            {
                mm.Body = emailBody;
                mm.IsBodyHtml = true;
                mm.Subject = "Registration OTP!";
                mm.Priority = MailPriority.High;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential()
                    {
                        UserName = "foodiveonline@gmail.com",
                        Password = "nzgmwdaufznbhgbi"
                    };
                    smtp.EnableSsl = true;

                    try
                    {
                        Session["RegOTP"] = sendOtp;
                        smtp.Send(mm);
                        Response.Redirect("/Visitor/OTP.aspx");
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", $"<script>alert('Error: {ex.Message}')</script>");
                    }
                }
            }
        }
    }
}
