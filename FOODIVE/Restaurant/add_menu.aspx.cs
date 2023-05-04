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
    public partial class add_menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindcate();
            }
            if (Session["rest_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        void bindcate()
        {
            string query = "select * from category";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            DropDownList1.DataSource = data;
            DropDownList1.DataTextField = "cate_name";
            DropDownList1.DataValueField = "cate_id";
            DropDownList1.DataBind();

            ListItem SelectItem = new ListItem("-- Select Category --", "-1");
            SelectItem.Selected = true;
            DropDownList1.Items.Insert(0, SelectItem);

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
                    
                    file.SaveAs(Request.PhysicalApplicationPath + "Image/Img/dishes/" + file.FileName.ToString());
                    string path = "/Image/Img/dishes/" + file.FileName.ToString();
                    con.Open();
                    string query = "insert into dishes ([rest_id],[subrest_id],[cate_id],[dishname],[description],[price],[image]) values('" + Session["rest_id"] + "','0','" + DropDownList1.SelectedValue.ToString() + "','" + txtd_name.Text.ToString() + "','" + txtabout.Text.ToString() + "','" + txtprice.Text.ToString() + "','" + path.ToString() + "')";
                    SqlCommand ins = new SqlCommand(query, con);
                    if (ins.ExecuteNonQuery() != 0)
                    {
                        Response.Redirect("all_menu.aspx");
                    }
                }
            }
        }
    }
}