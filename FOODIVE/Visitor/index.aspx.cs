using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Visitor
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> title = new List<string>();
        public List<string> rest_id = new List<string>();
        public List<string> image = new List<string>();
        public List<string> address = new List<string>();
        public List<string> city = new List<string>();
        public List<string> pincode = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            gettitle();
            getrest_id();
            getimage();
            getaddress();
            getcity();
            getpincode();
        }
        public void getrest_id()
        {
            con.Open();
            string query = "select top 3 rest_id from [restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                 rest_id.Add((dr["rest_id"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void gettitle()
        {
            con.Open();
            string query = "select top 3 title from [restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                title.Add((dr["title"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getimage()
        {
            con.Open();
            string query = "select top 3 image from [restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                 image.Add((dr["image"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getaddress()
        {
            con.Open();
            string query = "select top 3 address from [restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                 address.Add((dr["address"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getcity()
        {
            con.Open();
            string query = "select top 3 city from [restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                 city.Add((dr["city"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getpincode()
        {
            con.Open();
            string query = "select top 3 pincode from [restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                 pincode.Add((dr["pincode"]).ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}