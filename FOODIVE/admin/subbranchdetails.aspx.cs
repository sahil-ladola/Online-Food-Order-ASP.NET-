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
    public partial class subbranchdetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> subrest_id = new List<string>();
        public List<string> name = new List<string>();
        public List<string> email = new List<string>();
        public List<string> phone = new List<string>();
        public List<string> address = new List<string>();
        public List<string> image = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["branch"] == null)
            {
                Response.Redirect("all_restaurant.aspx");
            }
            getdata();
        }
        public void getdata()
        {
            con.Open();
            string query = "SELECT * FROM [sub_restro] where [rest_id] = " + Request.QueryString["branch"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                subrest_id.Add(dr["subrest_id"].ToString());
                name.Add(dr["title"].ToString());
                image.Add(dr["image"].ToString());
                address.Add(dr["address"].ToString());
                email.Add(dr["email"].ToString());
                phone.Add(dr["mobile_num"].ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}