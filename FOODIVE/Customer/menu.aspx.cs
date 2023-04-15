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
                SqlCommand quan = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] where r_id = " + Session["rid"].ToString(), con);
                quanatc.Text = quan.ExecuteScalar().ToString();
                con.Close();
                lblusername.Text = Session["username"].ToString();
            }
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            getimage();
            getdishname();
            getdescription();
            getprice();
            getd_id();
            if(Session["alert"] != null)
            {
                Response.Write("<script>alert('Dish Already in the cart , Increase the Quantity if you want more..')</script>");
                Session.Remove("alert");
            }
            Session["rest_id"] = Request.QueryString["rest_id"];
        }
        public void getimage()
        {
            con.Open();
            string query = "select image from [dishes] where rest_id = "+ Request.QueryString["rest_id"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                image.Add((dr["image"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getd_id()
        {
            con.Open();
            string query = "select d_id from [dishes] where rest_id = "+ Request.QueryString["rest_id"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                d_id.Add((dr["d_id"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getdishname()
        {
            con.Open();
            string query = "select dishname from [dishes] where rest_id =  "+ Request.QueryString["rest_id"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                dishname.Add((dr["dishname"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getdescription()
        {
            con.Open();
            string query = "select description from [dishes] where rest_id =  "+ Request.QueryString["rest_id"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                description.Add((dr["description"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getprice()
        {
            con.Open();
            string query = "select price from [dishes] where rest_id =  "+ Request.QueryString["rest_id"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                price.Add((dr["price"]).ToString());
            }
            dr.Close();
            con.Close();
        }
    }
}