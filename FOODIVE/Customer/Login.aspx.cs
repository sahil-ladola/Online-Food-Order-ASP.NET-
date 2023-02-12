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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (IsPostBack)
            {
                if (ViewState["txtEmail"] != null)
                {
                    txtEmail.Text = ViewState["txtEmail"].ToString();
                }
                if (ViewState["txtPassword"] != null)
                {
                    txtPassword.Text = ViewState["txtPassword"].ToString();
                }
            }
            if (!IsPostBack)
            {
                if (Request.Cookies["userName"] != null && Request.Cookies["password"] != null)
                {
                    txtEmail.Text = Request.Cookies["userName"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["password"].Value;
                }
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            //Remember me
            if(chkRememberme.Checked)
            {
                Response.Cookies["username"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Cookies["username"].Value = txtEmail.Text.Trim();
            Response.Cookies["password"].Value = txtPassword.Text.Trim();

            ViewState["txtEmail"] = txtEmail.Text;
            ViewState["txtPassword"] = txtPassword.Text;

            string select = "select fname , lname , email , password , r_id from register where email = '" + txtEmail.Text+"' and password = '"+txtPassword.Text+"'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                Session["login"] = "login";
                Session["email"] = dr["email"];
                Session["username"] = dr["fname"] + " " + dr["lname"];
                Response.Redirect("afterlogin.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Credential!')</script>");
            }
        }
    }
}