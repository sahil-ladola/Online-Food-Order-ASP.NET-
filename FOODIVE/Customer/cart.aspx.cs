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
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                con.Open();
                string chk = "select * from [add_to_cart] where [d_id] = " + Request.QueryString["d_id"].ToString() + " and [r_id] = " + Session["rid"].ToString();
                SqlCommand cmd = new SqlCommand(chk, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["alert"] = "alert";
                    dr.Close();
                    Response.Redirect("menu.aspx?rest_id=" + Session["rest_id"]);
                }
                string add = "insert into add_to_cart ([d_id],[rest_id],[subrest_id],[r_id],[quantity]) values ('" + Request.QueryString["d_id"].ToString() + "' , '" + Session["rest_id"].ToString() + "', '" + Session["subrest_id"].ToString() + "', '" + Session["rid"].ToString() + "' , 1 )";
                SqlCommand cmd1 = new SqlCommand(add, con);
                if (cmd1.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("menu.aspx?rest_id=" + Session["rest_id"]);
                }
                con.Close();
            }
        }
    }
}