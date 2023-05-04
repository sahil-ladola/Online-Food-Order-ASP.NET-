using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace FOODIVE.Restaurant
{
    public partial class add_restaurant : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rest_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
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
                    Filerestro_img.SaveAs(Request.PhysicalApplicationPath + "Image/Img/Restro/" + Filerestro_img.FileName.ToString());
                    string restropath = "/Image/Img/Restro/" + Filerestro_img.FileName.ToString();

                    string password = txtpassword.Text;
                    string salt = "mySalt";
                    string saltedPassword = string.Concat(password, salt);
                    SHA256 sha256 = SHA256.Create();
                    byte[] saltedPasswordBytes = Encoding.UTF8.GetBytes(saltedPassword);
                    byte[] hashedPasswordBytes = sha256.ComputeHash(saltedPasswordBytes);
                    string hashedPassword = Convert.ToBase64String(hashedPasswordBytes);

                    string query1 = "insert into restro_register_request values('" + txtname.Text + "','" + txtphone_number.Text + "','" + txtemail.Text + "','" + hashedPassword + "','" + path + "','" + txtaddress.Text + "','" + txtcity.Text + "','" + txtpincode.Text + "','" + txtrestro_name.Text + "','" + txtrestro_phone_number.Text + "','" + txtrestro_email.Text + "','" + restropath.ToString() + "','0','" + txtaddress.Text + "','" + txtcity.Text + "','" + txtpincode.Text + "')";
                    SqlCommand ins = new SqlCommand(query1, con);
                    if (ins.ExecuteNonQuery() != 0)
                    {
                        Session["isSubresreq"] = "true";
                        Application["Subresid"] = Session["rest_id"];
                        con.Close();
                        String emailbody = "Dear <b>" + txtname.Text + "!,</b><br> Your sub-restaurant registration request has been initialized , we'll let you know when your given details verified.";
                        MailMessage mm = new MailMessage("foodiveonline@gmail.com", txtemail.Text);
                        mm.Body = emailbody;
                        mm.IsBodyHtml = true;
                        mm.Subject = "Sub-Restaurant Registration Request Initialized!!!";
                        mm.Priority = MailPriority.High;
                        SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                        SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                        SMTP.UseDefaultCredentials = false;
                        SMTP.Credentials = new NetworkCredential()
                        {
                            UserName = "foodiveonline@gmail.com",
                            Password = "nzgmwdaufznbhgbi"
                        };
                        SMTP.EnableSsl = true;
                        SMTP.Send(mm);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Request has been Initialized..!!')</script>");
                    }
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
    }
}