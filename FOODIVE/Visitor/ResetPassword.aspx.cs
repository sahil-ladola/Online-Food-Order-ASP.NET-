using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;

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
            }
        }

        protected void btnResetpass_Click(object sender, EventArgs e)
        {
            if (txtNewpass.Text == txtConfirmNewpass.Text)
            {
                string password = txtNewpass.Text;
                string salt = "mySalt";

                string saltedPassword = string.Concat(password, salt);
                SHA256 sha256 = SHA256.Create();
                byte[] saltedPasswordBytes = Encoding.UTF8.GetBytes(saltedPassword);
                byte[] hashedPasswordBytes = sha256.ComputeHash(saltedPasswordBytes);
                string hashedPassword = Convert.ToBase64String(hashedPasswordBytes);

                con.Open();
                string update = "UPDATE register SET password=@NewPassword WHERE email=@Email";
                SqlCommand com = new SqlCommand(update, con);
                com.Parameters.AddWithValue("@NewPassword", hashedPassword);
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
                con.Close();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('New password and confirm password should be same.')</script>");
            }
        }
    }
}
