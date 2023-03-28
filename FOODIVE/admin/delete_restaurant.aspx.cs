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
    public partial class delete_restaurant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["res_del"] == null)
            {
                Response.Redirect("all_restaurant.aspx");
            }
            string query = "delete from dishes where rest_id = '" + Request.QueryString["res_del"] + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            if (cmd.ExecuteNonQuery() != 0)
            { 
                string q2 = "select resmng_id from restro where rest_id = '" + Request.QueryString["res_del"] + "'";
                SqlCommand cmd2 = new SqlCommand(q2, con);
                SqlDataReader dr = cmd2.ExecuteReader();
                if(dr.Read())
                {
                    string q3 = "delete from restro_manager where resmng_id = '" + dr["resmng_id"].ToString() + "'";
                    SqlCommand cmd3 = new SqlCommand(q3, con);
                    if(cmd3.ExecuteNonQuery() != 0)
                    {
                        string q4 = "delete from sub_restro where rest_id = '" + Request.QueryString["res_del"] + "'";
                        SqlCommand cmd4 = new SqlCommand(q4, con);
                        cmd4.ExecuteNonQuery();
                        string query1 = "delete from restro where rest_id = '" + Request.QueryString["res_del"] + "'";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        if (cmd1.ExecuteNonQuery() != 0)
                        {
                            Response.Redirect("all_restaurant.aspx");
                        }
                    }
                }
            }
            con.Close();
        }
    }
}