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

namespace FOODIVE
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        static int sendOtp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (IsPostBack)
            {
                if (Session["txtFname"] != null)
                {
                    txtFname.Text = Session["txtFname"].ToString();
                }
                if (Session["txtLname"] != null)
                {
                    txtLname.Text = Session["txtLname"].ToString();
                }
                if (Session["txtMobileNum"] != null)
                {
                    txtMobileNum.Text = Session["txtMobileNum"].ToString();
                }
                if (Session["txtPassword"] != null)
                {
                    txtPassword.Text = Session["txtPassword"].ToString();
                }
                if (Session["txtPincode"] != null)
                {
                    txtPincode.Text = Session["txtPincode"].ToString();
                }
                if (Session["txtAddress"] != null)
                {
                    txtAddress.Text = Session["txtAddress"].ToString();
                }
                if (Session["txtCity"] != null)
                {
                    txtCity.Text = Session["txtCity"].ToString();
                }
                if (Session["txtEmail"] != null)
                {
                    txtEmail.Text = Session["txtEmail"].ToString();
                }
            }
        }

        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            string select = "select * from register where email='" + txtEmail.Text + "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Email is already taken.')</script>");
            }
            else
            {
                dr.Close();

                Session["txtEmail"] = txtEmail.Text;
                Session["txtCity"] = txtCity.Text;
                Session["txtAddress"] = txtAddress.Text;
                Session["txtPincode"] = txtPincode.Text;
                Session["txtPassword"] = txtPassword.Text;
                Session["txtMobileNum"] = txtMobileNum.Text;
                Session["txtLname"] = txtLname.Text;
                Session["txtFname"] = txtFname.Text;

                Random random = new Random();
                sendOtp = random.Next(100000, 999999);
                String toEmail = txtEmail.Text;
                String username = txtFname.Text + " " + txtLname.Text;
                String emailbody = "Hello <b>" + username + "!</b><br> Here is your One Time Password For Registration : <b><u>" + sendOtp + "</u></b>.<br><br>Thank You For registration on FOODIVE Online Food Order System!!<br><br> Have A Good Day!";
                MailMessage mm = new MailMessage("foodiveonline@gmail.com", toEmail);
                mm.Body = emailbody;
                mm.IsBodyHtml = true;
                mm.Subject = "One Time Password For Registration!";
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
                Session["RegOTP"] = sendOtp;
                SMTP.Send(mm);

                Response.Redirect("../OTP.aspx");
            }
        }

        protected void txtFname_TextChanged(object sender, EventArgs e)
        {

        }
    }
}