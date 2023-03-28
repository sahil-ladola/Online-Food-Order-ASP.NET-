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
    public partial class update_category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> cate_name = new List<string>();
        public List<string> cate_id = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcate_name();
            }
            if(Request.QueryString["cat_upd"] == null)
            {
                Response.Redirect("all_category.aspx");
            }
        }
        public void getcate_name()
        {
            con.Open();
            string query = "select cate_name from category where cate_id = " + Request.QueryString["cat_upd"];
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                txtc_name.Text = dr["cate_name"].ToString();
            }
            dr.Close();
            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string sql = "update category set cate_name ='" + txtc_name.Text + "' where cate_id='"+ Request.QueryString["cat_upd"] + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            if (cmd.ExecuteNonQuery() != 0 )
            {
                Response.Redirect("all_category.aspx");
            }
            con.Close();
        }
    }
}