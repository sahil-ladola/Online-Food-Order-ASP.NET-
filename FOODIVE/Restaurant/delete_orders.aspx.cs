using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Restaurant
{
    public partial class delete_orders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            con.Open();
            string dlt = "delete from [order] where o_id = '" + Request.QueryString["order_del"] + "'";
            SqlCommand cmd = new SqlCommand(dlt, con);
            cmd.ExecuteNonQuery();
            Response.Redirect("all_orders.aspx");
        }
    }
}