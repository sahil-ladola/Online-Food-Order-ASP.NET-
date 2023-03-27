using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FOODIVE.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["err"] != null)
            {
                Response.Write("sahil");
                Session.Remove("err");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Equals("ADMIN") && txtpass.Text.Equals("adminFOODIVE"))
            {
                Session["admin"] = "admin";
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Invalid Credential!!!!')</script>");
            }
        }
    }
}