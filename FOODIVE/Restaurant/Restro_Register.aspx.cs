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
    public partial class Restro_Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("validate");
            con.Open();
            String query = "select * from restro where email = '" + txtrestro_email.Text + "'";
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
                        Filerestro_img.SaveAs(Request.PhysicalApplicationPath + "Restaurant/Res_img/" + Filerestro_img.FileName.ToString());
                        string path = "../Restaurant/Res_img/" + Filerestro_img.FileName.ToString();
                        string substatus = string.Empty;
                        if (Yes.Checked)
                        {
                            substatus = "1";
                        }
                        if(No.Checked)
                        {
                            substatus = "0";
                        }
                        string query1 = "insert into restro_register_request values('" + Session["mng_name"].ToString() + "','" + Session["mng_phone_num"].ToString() + "','" + Session["mng_email"].ToString() + "','" + Session["mng_password"].ToString() + "','" + Session["mng_adharcard"].ToString() + "','" + Session["mng_address"].ToString() + "','" + Session["mng_city"].ToString() + "','" + Session["mng_pincode"].ToString() + "','" + txtrestro_name.Text + "','" + txtrestro_phone_number.Text + "','" + txtrestro_email.Text + "','" + path.ToString() + "','" + substatus.ToString() + "','" + txtaddress.Text + "','" + txtcity.Text + "','" + txtpincode.Text + "')";
                        SqlCommand ins = new SqlCommand(query1, con);
                        if (ins.ExecuteNonQuery() != 0)
                        {
                            con.Close();
                            Session.Remove("mng_name");
                            Session.Remove("mng_email");
                            Session.Remove("mng_phone_num");
                            Session.Remove("mng_password");
                            Session.Remove("mng_adharcard");
                            Session.Remove("mng_address");
                            Session.Remove("mng_city");
                            Session.Remove("mng_pincode");
                            Session["requestmade"] = "request";
                            Response.Redirect("~/index.aspx");
                        }
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
            Response.Redirect("Registration.aspx");
        }
    }
}