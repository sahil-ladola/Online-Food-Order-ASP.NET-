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
    public partial class managerdetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> name = new List<string>();
        public List<string> email = new List<string>();
        public List<string> mobile_num = new List<string>();
        public List<string> address = new List<string>();
        public List<string> city = new List<string>();
        public List<string> pincode = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["mng_id"] == null)
            {
                Response.Redirect("all_restaurant.aspx");
            }
            Session["mng_id"] = Request.QueryString["mng_id"].ToString();
            getaddress();
            getcity();
            getemail();
            getmobile_num();
            getname();
            getpincode();
        }
        public void getname()
        {
            con.Open();
            string query = "select name from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name.Add(dr["name"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getemail()
        {
            con.Open();
            string query = "select email from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                email.Add(dr["email"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getmobile_num()
        {
            con.Open();
            string query = "select mobile_num from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                mobile_num.Add(dr["mobile_num"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getaddress()
        {
            con.Open();
            string query = "select address from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                address.Add(dr["address"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getcity()
        {
            con.Open();
            string query = "select city from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                city.Add(dr["city"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getpincode()
        {
            con.Open();
            string query = "select pincode from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                pincode.Add(dr["pincode"].ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}