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
    public partial class menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        public List<string> image = new List<string>();
        public List<string> d_id = new List<string>();
        public List<string> dishname = new List<string>();
        public List<string> description = new List<string>();
        public List<string> price = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null)
            {
                con.Open();
                SqlCommand quan = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] where r_id = @rid", con);
                quan.Parameters.AddWithValue("@rid", Session["rid"].ToString());
                quanatc.Text = quan.ExecuteScalar().ToString();
                lblusername.Text = Session["username"].ToString();
                con.Close();
            }

            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");

            GetData();

            if (Session["alert"] != null)
            {
                Response.Write("<script>alert('Dish Already in the cart , Increase the Quantity if you want more..')</script>");
                Session.Remove("alert");
            }
            Session["rest_id"] = Request.QueryString["rest_id"];
        }
        public void GetData()
        {
            con.Open();
            string query = "select image, d_id, dishname, description, price from [dishes] where rest_id = @rest_id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@rest_id", Request.QueryString["rest_id"]);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                image.Add((dr["image"]).ToString());
                d_id.Add((dr["d_id"]).ToString());
                dishname.Add((dr["dishname"]).ToString());
                description.Add((dr["description"]).ToString());
                price.Add((dr["price"]).ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}