using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace FOODIVE.admin
{
    public partial class delete_request : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["res_req_del"] == null)
            {
                Response.Redirect("restaurant_request.aspx");
            }
            con.Open();
            string mng_email = string.Empty;
            string mng_name = string.Empty;
            string query = "select mng_email , mng_name from [restro_register_request] where [req_id] = " + Request.QueryString["res_req_del"];
            SqlCommand cmd1 = new SqlCommand(query, con);
            SqlDataReader dr = cmd1.ExecuteReader();
            if(dr.Read())
            {
                mng_email = dr["mng_email"].ToString();
                mng_name = dr["mng_name"].ToString();
            }
            String dlt = "delete from [restro_register_request] where [req_id] = " + Request.QueryString["res_req_del"];
            SqlCommand cmd = new SqlCommand(dlt, con);
            if(cmd.ExecuteNonQuery() != 0)
            {
                String toEmail = mng_email.ToString();
                String username = mng_name.ToString() ;
                String emailbody = "Dear <b>" + username + "!,</b><br> Sorry to inform you but Your restaurant registration request have been rejected , kindly re-consider your all the information and apply again !!!";
                MailMessage mm = new MailMessage("foodiveonline@gmail.com", toEmail);
                mm.Body = emailbody;
                mm.IsBodyHtml = true;
                mm.Subject = "Restaurant Registration Request Rejected!!!";
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
                SMTP.Send(mm);
                Response.Redirect("restaurant_request.aspx");
            }
        }
    }
}