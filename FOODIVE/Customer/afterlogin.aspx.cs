using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Customer
{
    public partial class afterlogin : System.Web.UI.Page
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
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                con.Open();
                SqlCommand quan = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] where r_id = " + Session["rid"].ToString(), con);
                quanatc.Text = quan.ExecuteScalar().ToString();
                con.Close();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
                lblusername.Text = Session["username"].ToString();
            }
            getdata();
        }
        public void getdata()
        {
            con.Open();
            string query = "SELECT * FROM restro";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                rest_id.Add(dr["rest_id"].ToString());
                title.Add(dr["title"].ToString());
                image.Add(dr["image"].ToString());
                address.Add(dr["address"].ToString());
                city.Add(dr["city"].ToString());
                pincode.Add(dr["pincode"].ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}