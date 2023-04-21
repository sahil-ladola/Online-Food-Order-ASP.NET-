using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Customer
{
    public partial class modquan : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string mod = "update [add_to_cart] set [quantity]=@modquantity where [atc_id] = @atc_id";
            SqlCommand cmd = new SqlCommand(mod, con);
            cmd.Parameters.AddWithValue("@modquantity", Request.QueryString["modquantity"]);
            cmd.Parameters.AddWithValue("@atc_id", Request.QueryString["atc_id"]);
            if (cmd.ExecuteNonQuery() != 0)
            {
                Response.Redirect("AddToCart.aspx");
            }
        }
    }
}
