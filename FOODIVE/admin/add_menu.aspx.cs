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
    public partial class add_menu : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public List<string> rest_id = new List<string>();
        public List<string> res_name = new List<string>();
        public List<string> cate_name = new List<string>();
        public List<string> cate_id = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
            bindcate();
        }
        protected void bind()
        {
            using (SqlCommand cmd = new SqlCommand("select rest_id , title from restro", con))
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        restaurant.DataSource = dr;
                        restaurant.DataTextField = "title";
                        restaurant.DataValueField = "rest_id";
                        restaurant.DataBind();
                        restaurant.Items.Insert(0, new ListItem("-- Select Restaurant --", "0"));
                    }
                }
                con.Close();
            }
        }
        protected void bindcate()
        {
            using (SqlCommand cmd = new SqlCommand("select * from category", con))
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        category.DataSource = dr;
                        category.DataTextField = "cate_name";
                        category.DataValueField = "cate_id";
                        category.DataBind();
                        category.Items.Insert(0, new ListItem("-- Select Category --", "0"));
                    }
                }
                con.Close();
            }
        }
        private bool IsValidExtension(string filePath)
        {
            bool isValid = false;
            string[] fileExtensions = { ".bmp", ".jpg", ".png", ".gif", ".jpeg", ".BMP", ".JPG", ".PNG", ".GIF", ".JPEG" };

            for (int i = 0; i <= fileExtensions.Length - 1; i++)
            {
                if (filePath.Contains(fileExtensions[i]))
                {
                    isValid = true;
                }
            }
            return isValid;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (!IsValidExtension(file.PostedFile.FileName))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Only Images allowed.')</script>");
            }
            else
            {
                double fileSize = file.PostedFile.ContentLength;
                if (fileSize > 3145728.00)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('You can only upload files of size lesser than 3 MB.')</script>");
                }
                else
                {
                    file.SaveAs(Request.PhysicalApplicationPath + "Restaurant/Res_img/dishes" + file.FileName.ToString());
                    string path = "../Restaurant/Res_img/dishes" + file.FileName.ToString();
                    string query = "insert into dishes values('" + restaurant.SelectedValue.ToString() + "','" + Session["mng_phone_num"].ToString() + "','" + Session["mng_email"].ToString() + "','" + Session["mng_password"].ToString() + "','" + Session["mng_adharcard"].ToString() + "','" + Session["mng_address"].ToString() + "','" + Session["mng_city"].ToString() + "','" + Session["mng_pincode"].ToString() + "')";
                    SqlCommand ins = new SqlCommand(query, con);
                    if (ins.ExecuteNonQuery() != 0)
                    {
                    }
                }
            }
        }
    }
}