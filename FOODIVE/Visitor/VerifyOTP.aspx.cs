using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FOODIVE.Visitor
{
    public partial class VerifyOTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["txtCustEmail"] == null)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }
                else
                {
                    email.Text = Session["txtCustEmail"].ToString();
                }
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtVerotp.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please enter the OTP.')</script>");
                return;
            }

            try
            {
                int enteredOTP = Convert.ToInt32(txtVerotp.Text);

                if (enteredOTP == Convert.ToInt32(Session["verOTP"]))
                {
                    Response.Redirect("ResetPassword.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid OTP!!!')</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('An error occurred while verifying the OTP. Please try again later.')</script>");
            }
        }
    }
}
