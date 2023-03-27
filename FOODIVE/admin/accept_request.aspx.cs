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
    public partial class accept_request : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string mng_email = string.Empty;
            string mng_name = string.Empty;
            string querymng = "select mng_name , mng_phone_num , mng_email , mng_password , mng_adharcard , mng_address , mng_city , mng_pincode from restro_register_request where req_id = " + Request.QueryString["res_req_acc"];
            con.Open();
            SqlCommand cmd = new SqlCommand(querymng, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                mng_name = dr["mng_name"].ToString();
                mng_email = dr["mng_email"].ToString();
                string querymngins = "insert into [restro_manager] values('" + dr["mng_name"].ToString() + "','" + dr["mng_phone_num"].ToString() + "','" + dr["mng_address"].ToString() + "','" + dr["mng_city"].ToString() + "','" + dr["mng_pincode"].ToString() + "','" + dr["mng_adharcard"].ToString() + "','" + dr["mng_email"].ToString() + "','" + dr["mng_password"].ToString() + "')";
                SqlCommand ins = new SqlCommand(querymngins, con);
                ins.ExecuteNonQuery();
                dr.Close();
            }

            string querymngid = "select [resmng_id] from [restro_manager] where [email] = '" + mng_email.ToString() + "'";
            SqlCommand cmd1 = new SqlCommand(querymngid, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                string queryres = "select [res_name],[res_phone_number],[res_email],[res_image],[res_sub_status],[res_address],[res_city],[res_pincode] from restro_register_request where req_id = " + Request.QueryString["res_req_acc"];
                SqlCommand cmd2 = new SqlCommand(queryres, con);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.Read())
                {
                    string queryresins = "insert into [restro] ([resmng_id],[title],[email],[mobile_num],[address],[city],[pincode],[image],[subbranch_status]) values('" + dr1["resmng_id"].ToString() + "','" + dr2["res_name"].ToString() + "','" + dr2["res_email"].ToString() + "','" + dr2["res_phone_number"].ToString() + "','" + dr2["res_address"].ToString() + "','" + dr2["res_city"].ToString() + "','" + dr2["res_pincode"].ToString() + "','" + dr2["res_image"].ToString() + "','" + dr2["res_sub_status"].ToString() + "')";
                    SqlCommand insres = new SqlCommand(queryresins, con);
                    insres.ExecuteNonQuery();
                    dr.Close();
                }
            }
            string dlt = "delete from[restro_register_request] where[req_id] = " + Request.QueryString["res_req_acc"];
            SqlCommand cmddlt = new SqlCommand(dlt, con);
            if (cmddlt.ExecuteNonQuery() != 0)
            {
                String toEmail = mng_email.ToString();
                String username = mng_name.ToString();
                String emailbody = "Dear <b>" + username + "!,</b><br> We're happy to inform you that your restaurant registration request accepted..!! , now you can access website dashboard with register email and password !!!!";
                MailMessage mm = new MailMessage("foodiveonline@gmail.com", toEmail);
                mm.Body = emailbody;
                mm.IsBodyHtml = true;
                mm.Subject = "Restaurant Registration Request Accepted!!!";
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