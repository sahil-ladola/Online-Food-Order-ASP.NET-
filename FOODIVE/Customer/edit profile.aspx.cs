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
    public partial class edit_profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbluser.Text = Session["username"].ToString();
            con.Open();
            string select = "select * from register where email = '" + Session["email"].ToString() + "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                Username.Text = Session["username"].ToString();
                txtFirstName.Text = dr["fname"].ToString();
                txtLastName.Text = dr["lname"].ToString();
                txtMobileNumber.Text = dr["mobile_num"].ToString();
                txtAddress.Text = dr["address"].ToString();
                txtEmail.Text = dr["email"].ToString();
                txtCity.Text = dr["city"].ToString();
                txtPincode.Text = dr["pincode"].ToString();
            }
            con.Close();
        }

        protected void SaveProfile_Click(object sender, EventArgs e)
        {
            con.Open();
            string update = "update register set fname = '" + txtFirstName.Text + "' , lname = '" + txtLastName.Text + "' , mobile_num = '" + txtMobileNumber.Text + "', address = '" + txtAddress.Text + "', email = '" + txtEmail.Text + "', city = '" + txtCity.Text + "', pincode = '" + txtPincode.Text + "' where r_id = '" + Session["rid"] + "'";
            SqlCommand com = new SqlCommand(update, con);
            if (com.ExecuteNonQuery() != 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Profile Updated Successfully !!!')</script>");
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string select = "select * from register where email = '" + Session["email"] + "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader reader = result.ExecuteReader();
            if (reader.Read() == true)
            {
                if (txtOldPassword.Text == reader.GetString(8))
                {

                    string pass = "update register set password ='" + txtNewPassword.Text + "' where email = '" + Session["email"] + "'";
                    SqlCommand com = new SqlCommand(pass, con);
                    com.ExecuteNonQuery();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Password update successfully!')</script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Old password!')</script>");
                }


            }
            con.Close();
        }
    }
}