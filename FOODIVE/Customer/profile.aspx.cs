using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Customer
{
    public partial class profile : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                lbluser.Text = Session["username"].ToString();
                connection.Open();

                SqlCommand countCommand = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] WHERE r_id = @RestaurantId", connection);
                countCommand.Parameters.AddWithValue("@RestaurantId", Session["rid"].ToString());
                string count = countCommand.ExecuteScalar().ToString();
                quanatc.Text = count;

                string selectQuery = "SELECT * FROM register WHERE email = @Email";
                SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                selectCommand.Parameters.AddWithValue("@Email", Session["email"].ToString());
                using (SqlDataReader reader = selectCommand.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Address.Text = reader["address"].ToString();
                        Email.Text = reader["email"].ToString();
                        Username.Text = reader["fname"] + " " + reader["lname"];
                        ContactNumber.Text = reader["mobile_num"].ToString();
                    }
                }
            }
        }
    }
}
