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
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand restro = new SqlCommand("SELECT COUNT(*) FROM restro;", con);
            lblrestro.Text = restro.ExecuteScalar().ToString();

            SqlCommand dishes = new SqlCommand("SELECT COUNT(*) FROM dishes;", con);
            lbldishes.Text = dishes.ExecuteScalar().ToString();

            SqlCommand users = new SqlCommand("SELECT COUNT(*) FROM register;", con);
            lblusers.Text = users.ExecuteScalar().ToString();

            SqlCommand category = new SqlCommand("SELECT COUNT(*) FROM category;", con);
            lblcategory.Text = category.ExecuteScalar().ToString();

            SqlCommand process = new SqlCommand("SELECT COUNT(*) FROM [fd].[dbo].[order] WHERE status = '2';", con);
            lblprocess.Text = process.ExecuteScalar().ToString();
            
            SqlCommand deliver = new SqlCommand("SELECT COUNT(*) FROM [fd].[dbo].[order] WHERE status = '1';", con);
            lbldeliver.Text = deliver.ExecuteScalar().ToString();
            
            SqlCommand cancel = new SqlCommand("SELECT COUNT(*) FROM [fd].[dbo].[order] WHERE status = '3';", con);
            lblcancel.Text = cancel.ExecuteScalar().ToString();

            SqlCommand order = new SqlCommand("SELECT COUNT(*) FROM [fd].[dbo].[order];", con);
            lbltotal.Text = order.ExecuteScalar().ToString();

            int total = 0;
            SqlCommand earn = new SqlCommand("SELECT quantity, price FROM [fd].[dbo].[order] WHERE status= '1';", con);
            SqlDataReader dr = earn.ExecuteReader();
            while(dr.Read())
            {
                int price = (int) dr["price"];
                int quantity = (int)dr["quantity"];
                total += (price * quantity );
            }
            lblearn.Text = total.ToString();
            con.Close();
        }
    }
}