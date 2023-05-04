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
    public partial class all_restaurant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> rest_id = new List<string>();
        public List<string> restro_name = new List<string>();
        public List<string> email = new List<string>();
        public List<string> mobile_num = new List<string>();
        public List<string> address = new List<string>();
        public List<string> image = new List<string>();
        public List<string> manager = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getdata();
            }
            if (Session["rest_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public void getdata()
        {
            con.Open();
            string query = "select * from [sub_restro]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                rest_id.Add(dr["subrest_id"].ToString());
                restro_name.Add(dr["title"].ToString());
                email.Add(dr["email"].ToString());
                mobile_num.Add(dr["mobile_num"].ToString());
                address.Add(dr["address"].ToString());
                image.Add(dr["image"].ToString());
                manager.Add(dr["resmng_id"].ToString());
            }
        }
    }
}