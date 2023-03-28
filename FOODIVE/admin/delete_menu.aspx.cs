using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.admin
{
    public partial class delete_menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["menu_del"] == null)
            {
                Response.Redirect("all_menu.aspx");
            }
            string query = "delete from dishes where d_id = '" + Request.QueryString["menu_del"].ToString() + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(query , con);
            if(cmd.ExecuteNonQuery() != 0)
            {
                Response.Write("<script>alert('Item deleted successfully..')</script>");
                Response.Redirect("all_menu.aspx");
            }
        }
    }
}