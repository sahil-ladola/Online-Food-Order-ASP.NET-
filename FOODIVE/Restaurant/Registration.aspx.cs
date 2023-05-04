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
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Page.Validate("validate");
            if (!Page.IsValid)
            {
                return;
            }

            using (var con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "select * from restro_manager where email = @Email";
                    using (var result = new SqlCommand(query, con))
                    {
                        result.Parameters.AddWithValue("@Email", txtemail.Text);
                        using (var dr = result.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Email is already taken.')</script>");
                                return;
                            }
                        }
                    }

                    if (!IsValidExtension(FileAadhaar.PostedFile.FileName))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Only Images allowed.')</script>");
                        return;
                    }

                    double fileSize = FileAadhaar.PostedFile.ContentLength;
                    if (fileSize > 3145728.00)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('You can only upload files of size lesser than 3 MB.')</script>");
                        return;
                    }

                    FileAadhaar.SaveAs(Request.PhysicalApplicationPath + "Image/Img/RestroMngProof/" + FileAadhaar.FileName.ToString());
                    string path = "/Image/Img/RestroMngProof/" + FileAadhaar.FileName.ToString();
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
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
        }

        private bool IsValidExtension(string filePath)
        {
            string[] fileExtensions = { ".bmp", ".jpg", ".png", ".gif", ".jpeg", ".BMP", ".JPG", ".PNG", ".GIF", ".JPEG" };
            return fileExtensions.Any(x => filePath.EndsWith(x, StringComparison.OrdinalIgnoreCase));
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Visitor/index.aspx");
        }
    }
}
