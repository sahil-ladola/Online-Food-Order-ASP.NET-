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
    public partial class changw_password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //con.Open();
            //lbluser.Text = Session["username"].ToString();
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {

        }

        protected void btnChangePass_Click1(object sender, EventArgs e)
        {
            //string select = "select * from register where email = '" + Session["email"] + "'";
            //SqlCommand result = new SqlCommand(select, con);
            //SqlDataReader dr = result.ExecuteReader();
            //if (dr.Read() == true)
            //{
            //    if (txtOldPassword.Text == dr.GetString(8))
            //    {
            //        dr.Close();
            //        string pass = "update register set password ='" + txtNewPassword.Text + "' where email = '" + Session["email"] + "'";
            //        SqlCommand com = new SqlCommand(pass, con);
            //        if (com.ExecuteNonQuery() != 0)
            //        {
            //            //Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Password update successfully!')</script>");
            //            Response.Redirect("Login.aspx");
            //        }
            //    }
            //    else
            //    {
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Old password!')</script>");
            //    }
            //}
        }
    }
}