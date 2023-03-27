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
    public partial class add_category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query = "Insert into category (cate_name) values('" + txtc_name.Text + "')";
            con.Open();
            SqlCommand cmd = new SqlCommand(query,con);
            if (cmd.ExecuteNonQuery() != 0)
            {
                con.Close();
                Response.Redirect("all_category.aspx");
            }
        }
    }
}