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

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getreq_id();
                getmng_phone_num();
                getmng_name();
                getmng_email();
                getmng_adharcard();
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

    }
}