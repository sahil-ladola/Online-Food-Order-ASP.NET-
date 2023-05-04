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
    public partial class all_orders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> order_id = new List<string>();
        public List<string> fname = new List<string>();
        public List<string> lname = new List<string>();
        public List<string> address = new List<string>();
        public List<string> date = new List<string>();
        public List<string> amount = new List<string>();

        public List<string> o_id = new List<string>();
        public List<string> or_id = new List<string>();
        public List<string> dishname = new List<string>();
        public List<string> quantity = new List<string>();
        public List<string> price = new List<string>();
        public List<string> status = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            getdata();
        }
        public void getdata()
        {
            con.Open();
            string query = "select * from order_manager";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                order_id.Add((dr["order_id"]).ToString());
                fname.Add((dr["fname"]).ToString());
                lname.Add((dr["lname"]).ToString());
                address.Add((dr["address"]).ToString());
                date.Add((dr["date"]).ToString());
                amount.Add((dr["amount"]).ToString());
                string oq = "select * from [order] where order_id = " + dr["order_id"];
                SqlCommand cmd1 = new SqlCommand(oq, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while(dr1.Read())
                {
                    status.Add((dr1["status"]).ToString());
                    string d = "select dishname from dishes where d_id = " + dr1["d_id"];
                    SqlCommand cmd2 = new SqlCommand(d,con);
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if(dr2.Read())
                    {
                        dishname.Add((dr2["dishname"]).ToString());
                    }
                    quantity.Add((dr1["quantity"]).ToString());
                    price.Add((dr1["price"]).ToString());
                    o_id.Add((dr1["o_id"]).ToString());
                    or_id.Add((dr1["order_id"]).ToString());
                }
            }
        }
    }
}