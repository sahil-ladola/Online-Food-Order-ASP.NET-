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
    public partial class all_users : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        public List<string> rid = new List<string>();
        public List<string> fname = new List<string>();
        public List<string> lname = new List<string>();
        public List<string> email = new List<string>();
        public List<string> mobile_num = new List<string>();
        public List<string> address = new List<string>();
        public List<string> city = new List<string>();
        public List<string> pincode = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getrid();
                getfname();
                getlname();
                getemail();
                getmobile_num();
                getaddress();
                getcity();
                getpincode();
            }
        }
        public void getrid()
        {
            con.Open();
            string query = "select r_id from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                rid.Add((dr["r_id"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getfname()
        {
            con.Open();
            string query = "select fname from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                fname.Add((dr["fname"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getlname()
        {
            con.Open();
            string query = "select lname from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lname.Add((dr["lname"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getemail()
        {
            con.Open();
            string query = "select email from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                email.Add((dr["email"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmobile_num()
        {
            con.Open();
            string query = "select mobile_num from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mobile_num.Add((dr["mobile_num"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getaddress()
        {
            con.Open();
            string query = "select address from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
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
            string query = "select city from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
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
            string query = "select pincode from register";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pincode.Add((dr["pincode"]).ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}