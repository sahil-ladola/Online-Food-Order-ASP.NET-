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
            con.Open();
            lbluser.Text = Session["username"].ToString();
            string select = "select * from register where email = '" + Session["email"].ToString()+ "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if(dr.Read() == true)
            {
                txtAddress.Text = dr["address"].ToString();
                txtCity.Text = dr["city"].ToString();
                txtEmail.Text = dr["email"].ToString();
                txtFname.Text = dr["fname"].ToString();
                txtLname.Text = dr["lname"].ToString();
                txtMobileNum.Text = dr["mobile_num"].ToString();
                txtPincode.Text = dr["pincode"].ToString();
            }
        }
    }
}