using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace FOODIVE.Customer
{
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            con.Open();
            SqlCommand quan = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] where r_id = " + Session["rid"].ToString(), con);
            quanatc.Text = quan.ExecuteScalar().ToString();
            con.Close();
            con.Open();
            lbluser.Text = Session["username"].ToString();
            string select = "select * from register where email = '" + Session["email"].ToString() + "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                Address.Text = dr["address"].ToString();
                Email.Text = dr["email"].ToString();
                Username.Text = dr["fname"] + " " + dr["lname"];
                ContactNumber.Text = dr["mobile_num"].ToString();
            }
        }
    }
}