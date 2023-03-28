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
    public partial class all_category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        public List<string> cate_name = new List<string>();
        public List<string> cate_id = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getcate_id();
                getcate_name();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void getcate_id()
        {
            con.Open();
            string query = "select cate_id from category";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cate_id.Add((dr["cate_id"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getcate_name()
        {
            con.Open();
            string query = "select cate_name from category";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cate_name.Add((dr["cate_name"]).ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}