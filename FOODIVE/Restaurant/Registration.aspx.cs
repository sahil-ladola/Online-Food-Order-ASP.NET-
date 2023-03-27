using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Restaurant
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        { 
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Page.Validate("validate");
            con.Open();
            String query = "select * from restro_manager where email = '" + txtemail.Text + "'";
            SqlCommand result = new SqlCommand(query, con);
            SqlDataReader dr = result.ExecuteReader();
            if (dr.Read() == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Email is already taken.')</script>");
                dr.Close();
                con.Close();
            }
            else
            {
                if (!IsValidExtension(FileAadhaar.PostedFile.FileName))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Only Images allowed.')</script>");
                }
                else
                {
                    double fileSize = FileAadhaar.PostedFile.ContentLength;
                    if (fileSize > 3145728.00)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('You can only upload files of size lesser than 3 MB.')</script>");
                    }
                    else
                    {
                        FileAadhaar.SaveAs(Request.PhysicalApplicationPath + "Restaurant/Res_img/Restro manager adharcard/" + FileAadhaar.FileName.ToString());
                        string path = "../Restaurant/Res_img/Restro manager adharcard/" + FileAadhaar.FileName.ToString();
                        Session["mng_name"] = txtname.Text;
                        Session["mng_phone_num"] = txtphone_number.Text;
                        Session["mng_email"] = txtemail.Text;
                        Session["mng_password"] = txtpassword.Text;
                        Session["mng_adharcard"] = path;
                        Session["mng_address"] = txtaddress.Text;
                        Session["mng_city"] = txtcity.Text;
                        Session["mng_pincode"] = txtpincode.Text;
                        Response.Redirect("Restro_Register.aspx");
                    }
                }
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

        protected void reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }
    }
}