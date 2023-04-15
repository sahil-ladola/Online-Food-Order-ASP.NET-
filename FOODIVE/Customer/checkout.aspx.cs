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
            //con.Open();
            //string qins = "INSERT INTO [order_manager]([r_id],[fname],[lname],[email],[mobile_num],[address],[amount],[date]) values('" + Session["rid"] + "' , '" + Session["FN"] + "' , '" + Session["LN"] + "' , '" + Session["EM"] + "' , '" + Session["MN"] + "' , '" + Session["ADD"] + "' , '" + Session["DATE"] + "')";
            //SqlCommand cmd = new SqlCommand(qins,con);
            //if(cmd.ExecuteNonQuery() != 0 )
            //{
            //    string getid = "SELECT TOP 1 order_id FROM order_manager ORDER BY order_id DESC";
            //    SqlCommand cmd1 = new SqlCommand(getid, con);
            //    SqlDataReader dr = cmd1.ExecuteReader();
            //    if(dr.Read())
            //    {
            //        string order_id = dr["order_id"].ToString();

            //        string subrest_id = "0";
            //        string status = "2";
            //        string atc = "select * from [add_to_cart] where [r_id] =" + Session["rid"];
            //        SqlCommand cmd2 = new SqlCommand(atc, con);
            //        SqlDataReader dr2 = cmd2.ExecuteReader();
            //        while (dr2.Read())
            //        {
            //            string q1 = "INSERT INTO [order]([order_id],[rest_id],[subrest_id],[d_id],[r_id],[quantity],[status],[price]) values('" + order_id + "' , '" + dr2["rest_id"] + "', '" + subrest_id + "', '" + dr2["d_id"] + "', '" + dr2["r_id"] + "', '" + dr2["quantity"] + "', '" +  + "')"
            //        }
            //    }
            //}
            con.Open();
            string dlt = "delete from [add_to_cart] where [r_id] = " + Session["rid"];
            SqlCommand cmd = new SqlCommand(dlt , con);
            if(cmd.ExecuteNonQuery() != 0)
            {
                Response.Redirect("afterlogin.aspx");
            }
            con.Close();
        }
    }
}