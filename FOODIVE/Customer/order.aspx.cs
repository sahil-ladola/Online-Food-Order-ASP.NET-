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
    public partial class order : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        public List<string> o_id = new List<string>();
        public List<string> dishname = new List<string>();
        public List<string> quantity = new List<string>();
        public List<string> price = new List<string>();
        public List<string> status = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
                lblusername.Text = Session["username"].ToString();
            }
            getdata();
        }
        public void getdata()
        {
            con.Open();
            string slt = "select * from [order] where r_id=" + Session["rid"];
            SqlCommand cmd = new SqlCommand(slt,con);
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                string d = "select dishname from dishes where d_id = " + dr["d_id"];
                SqlCommand cmd1 = new SqlCommand(d,con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while(dr1.Read())
                {
                    dishname.Add((dr1["dishname"]).ToString());
                }
                quantity.Add((dr["quantity"]).ToString());
                price.Add((dr["price"]).ToString());
                status.Add((dr["status"]).ToString());
                o_id.Add((dr["o_id"]).ToString());
            }
        }
    }
}