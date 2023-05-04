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
    public partial class delete_subrestaurant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["subres_del"] == null)
            {
                Response.Redirect("subbranchdetails.aspx");
            }
            string query = "delete from dishes where subrest_id = '" + Request.QueryString["subres_del"] + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            if (cmd.ExecuteNonQuery() != 0)
            {
                string q4 = "delete from sub_restro where subrest_id = '" + Request.QueryString["subres_del"] + "'";
                SqlCommand cmd4 = new SqlCommand(q4, con);
                if (cmd4.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("subbranchdetails.aspx");
                }
            }
            con.Close();
        }
    }
}