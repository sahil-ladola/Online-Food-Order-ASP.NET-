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
    public partial class delete_category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["cat_del"] != null)
            {
                string query = "DELETE FROM category WHERE cate_id = " + Request.QueryString["cat_del"];
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                if (cmd.ExecuteNonQuery() != 0)
                    Response.Redirect("all_category.aspx");
                con.Close();
            }
            else
            {
                Response.Redirect("all_category.aspx");
            }
        }
    }
}