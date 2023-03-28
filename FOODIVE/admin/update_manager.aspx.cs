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
    public partial class update_manager : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mng_id"] == null)
            {
                Response.Redirect("managerdetails.aspx");
            }
            if (!IsPostBack)
            {
                con.Open();
                string query = "select * from restro_manager where resmng_id = @resmng_id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@resmng_id", Session["mng_id"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtaddress.Text = dr["address"].ToString();
                    txtcity.Text = dr["city"].ToString();
                    txtemail.Text = dr["email"].ToString();
                    txtpincode.Text = dr["pincode"].ToString();
                    txtname.Text = dr["name"].ToString();
                    txtphone_number.Text = dr["mobile_num"].ToString();
                }
                con.Close();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "update restro_manager set name=@name, email=@email, mobile_num=@mobile_num, address=@address, city=@city, pincode=@pincode where resmng_id=@resmng_id";
            using (SqlCommand up = new SqlCommand(query, con))
            {
                up.Parameters.AddWithValue("@name", txtname.Text.ToString());
                up.Parameters.AddWithValue("@email", txtemail.Text.ToString());
                up.Parameters.AddWithValue("@mobile_num", txtphone_number.Text);
                up.Parameters.AddWithValue("@address", txtaddress.Text.ToString());
                up.Parameters.AddWithValue("@city", txtcity.Text.ToString());
                up.Parameters.AddWithValue("@pincode", txtpincode.Text.ToString());
                up.Parameters.AddWithValue("@resmng_id", Session["mng_id"].ToString());
                if (up.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("managerdetails.aspx");
                }
            }
            con.Close();
        }
    }
}