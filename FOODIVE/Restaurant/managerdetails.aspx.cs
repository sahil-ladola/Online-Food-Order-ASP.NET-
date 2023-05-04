using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace FOODIVE.Restaurant
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
            if (Request.QueryString["mng_id"] == null)
            {
                Response.Redirect("all_restaurant.aspx");
            }
            Session["mng_id"] = Request.QueryString["mng_id"].ToString();
            getdata();
        }
        public void getdata()
        {
            con.Open();
            string query = "select * from restro_manager where resmng_id='" + Request.QueryString["mng_id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name.Add(dr["name"].ToString());
                email.Add(dr["email"].ToString());
                mobile_num.Add(dr["mobile_num"].ToString());
                address.Add(dr["address"].ToString());
                city.Add(dr["city"].ToString());
                pincode.Add(dr["pincode"].ToString());
            }
            con.Close();
        }
    }
}