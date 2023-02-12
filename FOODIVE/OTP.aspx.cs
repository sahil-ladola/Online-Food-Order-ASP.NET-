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

namespace FOODIVE
{
    public partial class OTP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            email.Text = Session["txtEmail"].ToString();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["RegOTP"]) == Convert.ToInt32(txtRegOtp.Text))
            {
                string query = "insert into register (fname,lname,mobile_num,address,city,pincode,email,password) values ('" + Session["txtFname"] + "','" + Session["txtLname"] + "','" + Session["txtMobileNum"] + "','" + Session["txtAddress"] + "','" + Session["txtCity"] + "','" + Session["txtPincode"] + "','" + Session["txtEmail"] + "','" + Session["txtPassword"] + "')";
                SqlCommand com = new SqlCommand(query, con);
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Customer/Login.aspx");
            }
        }
    }
}