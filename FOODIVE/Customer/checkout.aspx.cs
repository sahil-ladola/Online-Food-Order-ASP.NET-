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
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string qins = "INSERT INTO [dbo].[order_manager]([r_id],[fname],[lname],[email],[mobile_num],[address],[amount]) VALUES('" + Session["rid"].ToString() + "','" + Session["FN"].ToString() + "','" + Session["LN"].ToString() + "','" + Session["EM"].ToString() + "','" + Session["MN"].ToString() + "','" + Session["ADD"].ToString() + "','" + Session["amount"].ToString() + "')";
            SqlCommand cmd = new SqlCommand(qins, con);
            if(cmd.ExecuteNonQuery() != 0)
            {
                string oid = "select MAX(order_id) as order_id from order_manager";
                SqlCommand cmd2 = new SqlCommand(oid, con);
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.Read())
                {
                    string q = "select * from add_to_cart where r_id = " + Session["rid"];
                    SqlCommand cmd1 = new SqlCommand(q, con);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        string p = "select price from dishes where d_id = " + dr1["d_id"];
                        SqlCommand cmd3 = new SqlCommand(p, con);
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.Read())
                        {
                            string ins = "INSERT INTO [dbo].[order]([order_id],[rest_id],[subrest_id],[d_id],[r_id],[quantity],[price])VALUES('" + dr["order_id"] + "' , '" + dr1["rest_id"] + "' , '" + dr1["subrest_id"] + "' , '" + dr1["d_id"] + "' , '" + dr1["r_id"] + "' , '" + dr1["quantity"] + "' , '" + dr3["price"] + "')";
                            SqlCommand cmd4 = new SqlCommand(ins, con);
                            cmd4.ExecuteNonQuery();
                        }
                    }
                    string dlt = "delete from add_to_cart where r_id= " + Session["rid"];
                    SqlCommand cmd5 = new SqlCommand(dlt,con);
                    cmd5.ExecuteNonQuery();
                    Response.Redirect("order.aspx");
                }
            }
        }
    }
}