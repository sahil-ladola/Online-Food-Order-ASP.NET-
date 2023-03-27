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

namespace FOODIVE.Visitor
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnResetpass_Click(object sender, EventArgs e)
        {
            if (txtNewpass.Text == txtConfirmNewpass.Text)
            {
                string update = "update register set password ='" + txtNewpass.Text + "' where email = '" + Session["txtCustEmail"] + "'";
                SqlCommand com = new SqlCommand(update, con);
                if (com.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Old Password and New password doesn't match.')</script>");
            }
        }
    }
}