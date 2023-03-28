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
    public partial class all_menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> d_id = new List<string>();
        public List<string> restro_name = new List<string>();
        public List<string> dishname = new List<string>();
        public List<string> category = new List<string>();
        public List<string> desc = new List<string>();
        public List<string> price = new List<string>();
        public List<string> image = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getd_id();
                getrest_name();
                getdishname();
                getcategory();
                getdesc();
                getprice();
                getimage();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void getd_id()
        {
            con.Open();
            string query = "select d_id from dishes";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                d_id.Add(dr["d_id"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getrest_name()
        {
            con.Open();
            string query = "select rest_id , subrest_id from dishes";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if(dr["subrest_id"].ToString() == "0")
                {
                    string q1 = "select title from restro where rest_id = '" + dr["rest_id"].ToString() + "'";
                    SqlCommand cmd1 = new SqlCommand(q1, con);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if(dr1.Read())
                    {
                        restro_name.Add(dr1["title"].ToString());
                    }
                }
                if(dr["subrest_id"].ToString() != "0")
                {
                    string q2 = "select title from sub_restro where subrest_id = '" + dr["subrest_id"].ToString() + "'";
                    SqlCommand cmd2 = new SqlCommand(q2, con);
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if(dr2.Read())
                    {
                        restro_name.Add(dr2["title"].ToString());
                    }
                }
            }
            dr.Close();
            con.Close();
        }
        public void getdishname()
        {
            con.Open();
            string query = "select dishname from dishes";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                dishname.Add(dr["dishname"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getcategory()
        {
            con.Open();
            string query = "select cate_id from dishes";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string q1 = "select cate_name from category where cate_id= '" + dr["cate_id"] + "'";
                SqlCommand cmd1 = new SqlCommand(q1 , con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if(dr1.Read())
                {
                    category.Add(dr1["cate_name"].ToString());
                }
            }
            dr.Close();
            con.Close();
        }
        public void getdesc()
        {
            con.Open();
            string query = "select description from dishes";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                desc.Add(dr["description"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getprice()
        {
            con.Open();
            string query = "select price from dishes";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                price.Add(dr["price"].ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getimage()
        {
            con.Open();
            string query = "select image from dishes";
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
    }
}