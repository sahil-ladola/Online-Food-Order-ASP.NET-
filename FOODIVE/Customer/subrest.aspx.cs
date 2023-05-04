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
    public partial class subrest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> title = new List<string>();
        public List<string> rest_id = new List<string>();
        public List<string> image = new List<string>();
        public List<string> address = new List<string>();

        public List<string> subtitle = new List<string>();
        public List<string> srest_id = new List<string>();
        public List<string> subrest_id = new List<string>();
        public List<string> subimage = new List<string>();
        public List<string> subaddress = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            if (Request.QueryString["rest_id"].ToString() != null)
            { 
                
                string chk = "select subbranch_status from restro where rest_id='" + Request.QueryString["rest_id"] + "'";
                SqlCommand cmd = new SqlCommand(chk, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        if (Session["rid"] != null)
                        {
                            
                            SqlCommand quan = new SqlCommand("SELECT COUNT(*) FROM [add_to_cart] where r_id = @rid", con);
                            quan.Parameters.AddWithValue("@rid", Session["rid"].ToString());
                            quanatc.Text = quan.ExecuteScalar().ToString();
                            lblusername.Text = Session["username"].ToString();
                            
                        }
                        string query = "SELECT title , rest_id, image, address FROM restro where rest_id =" + Request.QueryString["rest_id"].ToString();
                        SqlCommand cmd1 = new SqlCommand(query, con);
                        SqlDataReader dr1 = cmd1.ExecuteReader();

                        while (dr1.Read())
                        {
                            rest_id.Add(dr1["rest_id"].ToString());
                            title.Add(dr1["title"].ToString());
                            image.Add(dr1["image"].ToString());
                            address.Add(dr1["address"].ToString());
                        }
                        dr1.Close();
                        
                        string query2 = "SELECT title , rest_id,subrest_id, image, address FROM sub_restro where rest_id =" + Request.QueryString["rest_id"].ToString();
                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        SqlDataReader dr2 = cmd2.ExecuteReader();

                        while (dr2.Read())
                        {
                            srest_id.Add(dr2["rest_id"].ToString());
                            subrest_id.Add(dr2["subrest_id"].ToString());
                            subtitle.Add(dr2["title"].ToString());
                            subimage.Add(dr2["image"].ToString());
                            subaddress.Add(dr2["address"].ToString());
                        }
                        dr2.Close();
                        
                    }
                }
                else
                {
                    Response.Redirect("menu.aspx?rest_id="+ Request.QueryString["rest_id"]);
                }
                con.Close();
            }
        }
    }
}