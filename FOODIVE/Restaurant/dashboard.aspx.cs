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
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["rest_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
            con.Open();
            
            SqlCommand dishes = new SqlCommand("SELECT COUNT(*) FROM dishes where rest_id='"+ Session["rest_id"] + "'", con);
            lbldishes.Text = dishes.ExecuteScalar().ToString();

            SqlCommand process = new SqlCommand("SELECT COUNT(*) FROM [order] WHERE status = '2' AND rest_id='" + Session["rest_id"] + "'", con);
            lblprocess.Text = process.ExecuteScalar().ToString();

            SqlCommand deliver = new SqlCommand("SELECT COUNT(*) FROM [order] WHERE status = '1' AND rest_id='" + Session["rest_id"] + "'", con);
            lbldeliver.Text = deliver.ExecuteScalar().ToString();

            SqlCommand cancel = new SqlCommand("SELECT COUNT(*) FROM [order] WHERE status = '3' AND rest_id='" + Session["rest_id"] + "'", con);
            lblcancel.Text = cancel.ExecuteScalar().ToString();

            SqlCommand order = new SqlCommand("SELECT COUNT(*) FROM [order] WHERE rest_id='" + Session["rest_id"] + "'", con);
            lbltotal.Text = order.ExecuteScalar().ToString();

            int total = 0;
            SqlCommand earn = new SqlCommand("SELECT quantity, price FROM [order] WHERE status= '1' AND rest_id='" + Session["rest_id"] + "'", con);
            SqlDataReader dr2 = earn.ExecuteReader();
            while (dr2.Read())
            {
                int price = (int)dr2["price"];
                int quantity = (int)dr2["quantity"];
                total += (price * quantity);
            }
            lblearn.Text = total.ToString();
            con.Close();
        }
    }
}