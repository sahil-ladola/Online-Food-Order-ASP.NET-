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
    public partial class update_restaurant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["res_upd"] == null)
            {
                Response.Redirect("all_restaurant.aspx");
            }
            if (!IsPostBack)
            {
                con.Open();
                string query = "select * from restro where rest_id = @rest_id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@rest_id", Request.QueryString["res_upd"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtRestroName.Text = dr["title"].ToString();
                    txtrestro_email.Text = dr["email"].ToString();
                    txtrestro_phone_number.Text = dr["mobile_num"].ToString();
                    txtaddress.Text = dr["address"].ToString();
                    txtcity.Text = dr["city"].ToString();
                    txtpincode.Text = dr["pincode"].ToString();
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
            con.Open();
            if (!IsValidExtension(Filerestro_img.PostedFile.FileName))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Only Images allowed.')</script>");
            }
            else
            {
                double fileSize = Filerestro_img.PostedFile.ContentLength;
                if (fileSize > 3145728.00)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('You can only upload files of size lesser than 3 MB.')</script>");
                }
                else
                {
                    Filerestro_img.SaveAs(Server.MapPath("~/Image/Img/Restro/" + Filerestro_img.FileName.ToString()));
                    string path = "/Image/Img/Restro/" + Filerestro_img.FileName.ToString();
                    string query = "update restro set title=@title, email=@email, mobile_num=@mobile_num, address=@address, city=@city, pincode=@pincode, image=@image where rest_id=@rest_id";
                    using (SqlCommand up = new SqlCommand(query, con))
                    {
                        up.Parameters.AddWithValue("@title", txtRestroName.Text.ToString());
                        up.Parameters.AddWithValue("@email", txtrestro_email.Text.ToString());
                        up.Parameters.AddWithValue("@mobile_num", txtrestro_phone_number.Text);
                        up.Parameters.AddWithValue("@address", txtaddress.Text.ToString());
                        up.Parameters.AddWithValue("@city", txtcity.Text.ToString());
                        up.Parameters.AddWithValue("@pincode", txtpincode.Text.ToString());
                        up.Parameters.AddWithValue("@image", path.ToString());
                        up.Parameters.AddWithValue("@rest_id", Request.QueryString["res_upd"].ToString());
                        if (up.ExecuteNonQuery() != 0)
                        {
                            Response.Redirect("all_restaurant.aspx");
                        }
                    }
                }
            }
        }
    }
}