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
    public partial class all_restaurant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> rest_id = new List<string>();
        public List<string> restro_name = new List<string>();
        public List<string> email = new List<string>();
        public List<string> mobile_num = new List<string>();
        public List<string> address = new List<string>();
        public List<string> city = new List<string>();
        public List<string> pincode = new List<string>();
        public List<string> image = new List<string>();
        public List<string> sub_branch = new List<string>();
        public List<string> manager = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getrest_id();
                getrestro_name();
                getemail();
                getmobile_num();
                getaddress();
                getcity();
                getpincode();
                getimage();
                getsub_branch();
                getmanager();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void getrest_id()
        {
            con.Open();
            string query = "select rest_id from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                rest_id.Add(dr["rest_id"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getrestro_name()
        {
            con.Open();
            string query = "select title from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                restro_name.Add(dr["title"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getemail()
        {
            con.Open();
            string query = "select email from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                email.Add(dr["email"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmobile_num()
        {
            con.Open();
            string query = "select mobile_num from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mobile_num.Add(dr["mobile_num"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getaddress()
        {
            con.Open();
            string query = "select address from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                address.Add(dr["address"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getcity()
        {
            con.Open();
            string query = "select city from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                city.Add(dr["city"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getpincode()
        {
            con.Open();
            string query = "select pincode from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pincode.Add(dr["pincode"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getimage()
        {
            con.Open();
            string query = "select image from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                image.Add(dr["image"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getsub_branch()
        {
            con.Open();
            string query = "select subbranch_status from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                sub_branch.Add(dr["subbranch_status"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmanager()
        {
            con.Open();
            string query = "select resmng_id from restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                manager.Add(dr["resmng_id"].ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}