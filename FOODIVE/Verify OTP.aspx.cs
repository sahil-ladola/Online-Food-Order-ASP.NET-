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
    public partial class Verify_OTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email.Text = Session["txtCustEmail"].ToString();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["verOTP"]) == Convert.ToInt32(txtVerotp.Text))
            {
                Response.Redirect("Reset Password.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid OTP!!!')</script>");
                //Response.Write("Invalid OTP");
            }
        }
    }
}