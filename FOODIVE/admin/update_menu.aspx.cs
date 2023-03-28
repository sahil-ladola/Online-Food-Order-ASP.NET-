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
    public partial class update_menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["menu_upd"] == null)
            {
                Response.Redirect("all_menu.aspx");
            }
            if (!IsPostBack)
            {
                bindcate();
                bindres();
                con.Open();
                string query = "select * from dishes where d_id = @d_id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@d_id", Request.QueryString["menu_upd"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtd_name.Text = dr["dishname"].ToString();
                    txtabout.Text = dr["description"].ToString();
                    txtprice.Text = dr["price"].ToString();
                }
                con.Close();
            }
        }
        void bindcate()
        {
            con.Open();
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
            con.Close();
        }

        void bindres()
        {
            con.Open();
            string query = "select rest_id, title from restro union select subrest_id, title from sub_restro";
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
            con.Close();
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
                    file.SaveAs(Server.MapPath("~/Image/Img/dishes/" + file.FileName.ToString()));
                    string path = "/Image/Img/dishes/" + file.FileName.ToString();
                    string selectq = "select * from restro where title = @title;";
                    using (SqlCommand cmd = new SqlCommand(selectq, con))
                    {
                        cmd.Parameters.AddWithValue("@title", DropDownList2.SelectedItem.Text);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                restro_id = dr["rest_id"].ToString();
                            }
                        }
                    }
                    string selectq2 = "select * from sub_restro where title = @title;";
                    using (SqlCommand cmd2 = new SqlCommand(selectq2, con))
                    {
                        cmd2.Parameters.AddWithValue("@title", DropDownList2.SelectedItem.Text);
                        using (SqlDataReader dr2 = cmd2.ExecuteReader())
                        {
                            if (dr2.Read())
                            {
                                sub_restro_id = dr2["subrest_id"].ToString();
                                restro_id = dr2["rest_id"].ToString();
                            }
                        }
                    }
                    string query = "update dishes set rest_id=@restro_id, subrest_id=@sub_restro_id, cate_id=@cate_id, dishname=@dishname, description=@description, price=@price, image=@image where d_id=@d_id";
                    using (SqlCommand up = new SqlCommand(query, con))
                    {
                        up.Parameters.AddWithValue("@restro_id", restro_id.ToString());
                        up.Parameters.AddWithValue("@sub_restro_id", sub_restro_id.ToString());
                        up.Parameters.AddWithValue("@cate_id", DropDownList1.SelectedValue.ToString());
                        up.Parameters.AddWithValue("@dishname", txtd_name.Text.ToString());
                        up.Parameters.AddWithValue("@description", txtabout.Text.ToString());
                        up.Parameters.AddWithValue("@price", txtprice.Text.ToString());
                        up.Parameters.AddWithValue("@image", path.ToString());
                        up.Parameters.AddWithValue("@d_id", Request.QueryString["menu_upd"].ToString());
                        if (up.ExecuteNonQuery() != 0)
                        {
                            Response.Redirect("all_menu.aspx");
                        }
                    }
                }
            }
        }
    }
}