using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace FOODIVE.Visitor
{
    public partial class Forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && ViewState["txtCustEmail"] != null)
            {
                txtCustomerEmail.Text = ViewState["txtCustEmail"].ToString();
            }
        }

        protected void btnsendOTP_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
                {
                    con.Open();
                    ViewState["txtEmail"] = txtCustomerEmail.Text;
                    string select = "select * from register where email=@Email";
                    using (SqlCommand result = new SqlCommand(select, con))
                    {
                        result.Parameters.AddWithValue("@Email", txtCustomerEmail.Text);
                        using (SqlDataReader dr = result.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Random random = new Random();
                                int sendOtp = random.Next(100000, 999999);
                                string toEmail = txtCustomerEmail.Text;
                                string username = $"{dr["fname"]} {dr["lname"]}";
                                string emailbody = $"Dear <b>{username},</b><br><br>You have requested to reset your password for FOODIVE Online Food Order System! Please use the following One Time Password (OTP) to complete the process:<br><br> OTP: <strong><u>{sendOtp}</u></strong><br><br>This OTP will expire in 5 minutes.<br><br>Thank you for using FOODIVE Online Food Order System!Best regards,<br><br>FOODIVE team";
                                using (MailMessage mm = new MailMessage("foodiveonline@gmail.com", toEmail))
                                {
                                    mm.Body = emailbody;
                                    mm.IsBodyHtml = true;
                                    mm.Subject = "FORGOT PASSWORD OTP!";
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
                                        smtp.Send(mm);
                                    }
                                }
                                Session["verOTP"] = sendOtp;
                                Session["txtCustEmail"] = txtCustomerEmail.Text;
                                Response.Redirect("VerifyOTP.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Email not found!!!');", true);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{ex.Message}');", true);
            }
        }
    }
}
