using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Restaurant
{
    public partial class all_menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> d_id = new List<string>();
        public List<string> dishname = new List<string>();
        public List<string> category = new List<string>();
        public List<string> desc = new List<string>();
        public List<string> price = new List<string>();
        public List<string> image = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getdata();
                getcategory();
            }
            if (Session["rest_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void getdata()
        {
            con.Open();
            string query = "select * from dishes where rest_id='" + Session["rest_id"] + "' AND subrest_id='0'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                d_id.Add(dr["d_id"].ToString());
                dishname.Add(dr["dishname"].ToString());
                desc.Add(dr["description"].ToString());
                price.Add(dr["price"].ToString());
                image.Add(dr["image"].ToString());
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
                SqlCommand cmd1 = new SqlCommand(q1, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    category.Add(dr1["cate_name"].ToString());
                }
            }
            dr.Close();
            con.Close();
        }
    }
}