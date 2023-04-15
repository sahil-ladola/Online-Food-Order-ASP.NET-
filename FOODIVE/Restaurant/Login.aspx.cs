using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Restaurant
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            string select = "select email , password from restro_manager where email = '" + txtUsername.Text + "' and password = '" + txtpass.Text + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                Session["restro"] = dr["email"].ToString();
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials!!!')</script>");
            }
            con.Close();
            //if restro login then set session 
            //Session["restro_id"] = dr["rest_id"];
            // then check it on add restro page if session set then show it like add sub restro 
            // add sub branch page put link which forward user to restro registration page
            
        }
    }
}