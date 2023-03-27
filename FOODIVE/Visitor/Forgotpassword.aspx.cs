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

namespace FOODIVE.Visitor
{
    public partial class Forgotpassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        static int sendOtp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (IsPostBack)
            {
                if (ViewState["txtCustEmail"] != null)
                {
                    txtCustomerEmail.Text = ViewState["txtCustEmail"].ToString();
                }
            }
        }

        protected void btnsendOTP_Click(object sender, EventArgs e)
        {
            ViewState["txtEmail"] = txtCustomerEmail.Text;
            string select = "select * from register where email='" + txtCustomerEmail.Text + "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                Random random = new Random();
                sendOtp = random.Next(100000, 999999);
                String toEmail = txtCustomerEmail.Text;
                String username = dr["fname"].ToString() + " " + dr["lname"].ToString();
                String emailbody = "Dear <b>" + username + "!,</b><br> To continue process of forgot password , Here is the One Time password : <strong> <u>" + sendOtp + "</u></strong>.";
                MailMessage mm = new MailMessage("foodiveonline@gmail.com", toEmail);
                mm.Body = emailbody;
                mm.IsBodyHtml = true;
                mm.Subject = "OTP for FORGOT PASSWORD!";
                mm.Priority = MailPriority.High;
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.UseDefaultCredentials = false;
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "foodiveonline@gmail.com",
                    Password = "nzgmwdaufznbhgbi"
                };
                SMTP.EnableSsl = true;
                Session["verOTP"] = sendOtp;
                Session["txtCustEmail"] = txtCustomerEmail.Text;
                SMTP.Send(mm);
                Response.Redirect("VerifyOTP.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Email not found!!!')</script>");
            }
        }
    }
}