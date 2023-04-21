using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace FOODIVE.Visitor
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

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
                    con.Open();
                }
            }
        }

        protected void btnResetpass_Click(object sender, EventArgs e)
        {
            if (txtNewpass.Text == txtConfirmNewpass.Text)
            {
                try
                {
                    string update = "UPDATE register SET password=@NewPassword WHERE email=@Email";
                    SqlCommand com = new SqlCommand(update, con);
                    com.Parameters.AddWithValue("@NewPassword", txtNewpass.Text);
                    com.Parameters.AddWithValue("@Email", Session["txtCustEmail"].ToString());

                    if (com.ExecuteNonQuery() != 0)
                    {
                        con.Close();
                        Response.Redirect("~/Customer/Login.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('An error occurred while resetting your password. Please try again later.')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('An error occurred while resetting your password. Please try again later.')</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('New password and confirm password should be same.')</script>");
            }
        }
    }
}
