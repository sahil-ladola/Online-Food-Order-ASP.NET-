using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.admin
{
    public partial class restaurant_request : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> req_id = new List<string>();
        public List<string> mng_name = new List<string>();
        public List<string> mng_phone_num = new List<string>();
        public List<string> mng_email = new List<string>();
        public List<string> mng_adharcard = new List<string>();
        public List<string> mng_address = new List<string>();
        public List<string> mng_city = new List<string>();
        public List<string> mng_pincode = new List<string>();
        public List<string> res_name = new List<string>();
        public List<string> res_phone_number = new List<string>();
        public List<string> res_email = new List<string>();
        public List<string> res_image = new List<string>();
        public List<string> res_sub_status = new List<string>();
        public List<string> res_address = new List<string>();
        public List<string> res_city = new List<string>();
        public List<string> res_pincode = new List<string>();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if(!IsPostBack)
            {
                getreq_id();
                getmng_phone_num();
                getmng_name();
                getmng_email();
                getmng_adharcard();
                getres_pincode();
                getres_city();
                getres_address();
                getres_sub_status();
                getres_image();
                getres_email(); 
                getres_phone_number();
                getres_name();
                getmng_pincode();
                getmng_city();
                getmng_address();
            }
        }
        public void getreq_id()
        {
            con.Open();
            string query = "select req_id from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                req_id.Add((dr["req_id"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_name()
        {
            con.Open();
            string query = "select mng_name from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_name.Add((dr["mng_name"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_phone_num()
        {
            con.Open();
            string query = "select mng_phone_num from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_phone_num.Add((dr["mng_phone_num"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_email()
        {
            con.Open();
            string query = "select mng_email from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_email.Add((dr["mng_email"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_adharcard()
        {
            con.Open();
            string query = "select mng_adharcard from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_adharcard.Add((dr["mng_adharcard"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_address()
        {
            con.Open();
            string query = "select [mng_address] from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_address.Add((dr["mng_address"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_city()
        {
            con.Open();
            string query = "select [mng_city] from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_city.Add((dr["mng_city"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmng_pincode()
        {
            con.Open();
            string query = "select [mng_pincode] from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mng_pincode.Add((dr["mng_pincode"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_name()
        {
            con.Open();
            string query = "select res_name from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_name.Add((dr["res_name"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_phone_number()
        {
            con.Open();
            string query = "select res_phone_number from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_phone_number.Add((dr["res_phone_number"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_email()
        {
            con.Open();
            string query = "select res_email from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_email.Add((dr["res_email"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_image()
        {
            con.Open();
            string query = "select res_image from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_image.Add((dr["res_image"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_sub_status()
        {
            con.Open();
            string query = "select res_sub_status from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_sub_status.Add((dr["res_sub_status"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_address()
        {
            con.Open();
            string query = "select [res_address] from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_address.Add((dr["res_address"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_city()
        {
            con.Open();
            string query = "select [res_city] from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_city.Add((dr["res_city"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getres_pincode()
        {
            con.Open();
            string query = "select [res_pincode] from restro_register_request";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                res_pincode.Add((dr["res_pincode"]).ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}