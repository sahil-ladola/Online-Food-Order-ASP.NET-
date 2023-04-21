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
    public partial class payment : System.Web.UI.Page
    {
        public List<string> quantity = new List<string>();
        public List<string> price = new List<string>();
        public List<string> atc_id = new List<string>();
        public List<string> dishNameList = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                con.Open();

                SqlCommand cnt = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] WHERE r_id = @r_id", con);
                cnt.Parameters.AddWithValue("@r_id", Session["rid"].ToString());
                countcart.Text = cnt.ExecuteScalar().ToString();

                getAtcId(con);
                getPrice(con);
                getQuantity(con);
                getDishName(con);

                SqlCommand cmd = new SqlCommand("SELECT * FROM register WHERE r_id = @r_id", con);
                cmd.Parameters.AddWithValue("@r_id", Session["rid"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtFname.Text = dr["fname"].ToString();
                    txtLname.Text = dr["lname"].ToString();
                    txtEmail.Text = dr["email"].ToString();
                    txtMobileNum.Text = dr["mobile_num"].ToString();
                    txtAddress.Text = dr["address"].ToString();
                    txtCity.Text = dr["city"].ToString();
                    txtPincode.Text = dr["pincode"].ToString();
                }

                dr.Close();
            }
        }
        public void getAtcId(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("SELECT atc_id FROM [add_to_cart] WHERE r_id = @r_id", con);
            cmd.Parameters.AddWithValue("@r_id", Session["rid"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                atc_id.Add(dr["atc_id"].ToString());
            }

            dr.Close();
        }
        public void getDishName(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("SELECT d_id FROM [add_to_cart] WHERE r_id = @r_id", con);
            cmd.Parameters.AddWithValue("@r_id", Session["rid"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                SqlCommand cmd1 = new SqlCommand("SELECT dishname FROM dishes WHERE d_id = @d_id", con);
                cmd1.Parameters.AddWithValue("@d_id", dr["d_id"].ToString());
                SqlDataReader dr1 = cmd1.ExecuteReader();

                while (dr1.Read())
                {
                    dishNameList.Add(dr1["dishname"].ToString());
                }

                dr1.Close();
            }

            dr.Close();
        }
        public void getQuantity(SqlConnection con)
        {
            con.Open();
            string query = "select [quantity] from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                quantity.Add((dr["quantity"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getPrice(SqlConnection con)
        {
            con.Open();
            string did = "select d_id from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(did, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string img = "select price from dishes where d_id = " + dr["d_id"].ToString();
                dr.Close();
                SqlCommand cmd1 = new SqlCommand(img, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    price.Add((dr1["price"]).ToString());
                }
                dr1.Close();
            }
            con.Close();
        }
    }
}