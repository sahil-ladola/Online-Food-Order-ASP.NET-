using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FOODIVE.Restaurant
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //if restro login then set session 
            //Session["restro_id"] = dr["rest_id"];
            // then check it on add restro page if session set then show it like add sub restro 
            // add sub branch page put link which forward user to restro registration page
            Response.Redirect("dashboard.aspx");
        }
    }
}