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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindcate();
                bindres();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        void bindcate()
        {
            string query = "select * from category";
            SqlDataAdapter sda = new SqlDataAdapter(query,con);
            DataTable data = new DataTable();
            sda.Fill(data);
            DropDownList1.DataSource = data;
            DropDownList1.DataTextField = "cate_name";
            DropDownList1.DataValueField = "cate_id";
            DropDownList1.DataBind();

            ListItem SelectItem = new ListItem("-- Select Category --" , "-1");
            SelectItem.Selected = true;
            DropDownList1.Items.Insert(0, SelectItem);

        }

        void bindres()
        {
            string query = "select rest_id , title from restro union select subrest_id , title from sub_restro";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            DropDownList2.DataSource = data;
            DropDownList2.DataTextField = "title";
            DropDownList2.DataValueField = "rest_id";
            DropDownList2.DataBind();

            ListItem SelectItem = new ListItem("-- Select Restaurant --", "-1");
            SelectItem.Selected = true;
            DropDownList2.Items.Insert(0, SelectItem);

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
                    string sub_restro_id = "0";
                    string restro_id = "0";
                    file.SaveAs(Request.PhysicalApplicationPath + "Image/Img/dishes/" + file.FileName.ToString());
                    string path = "/Image/Img/dishes/" + file.FileName.ToString();
                    con.Open();
                    string selectq = "select * from restro where title = '" + DropDownList2.SelectedItem.Text + "';";
                    SqlCommand cmd = new SqlCommand(selectq, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        sub_restro_id = "0";
                        restro_id = dr["rest_id"].ToString();
                    }
                    string selectq2 = "select * from sub_restro where title = '" + DropDownList2.SelectedItem.Text + "';";
                    SqlCommand cmd2 = new SqlCommand(selectq2, con);
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr.Read())
                    {
                        sub_restro_id = dr2["subrest_id"].ToString();
                        restro_id = dr2["rest_id"].ToString();
                    }
                    string query = "insert into dishes values('" + restro_id.ToString() + "','" + sub_restro_id.ToString() + "','" + DropDownList1.SelectedValue.ToString() + "','" + txtd_name.Text.ToString() + "','" + txtabout.Text.ToString() + "','" + txtprice.Text.ToString() + "','" + path.ToString() + "')";
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