﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FOODIVE.Customer
{
	public partial class AddToCart1 : System.Web.UI.Page
	{
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        public List<string> image = new List<string>();
        public List<string> dishname = new List<string>();
        public List<string> price = new List<string>();
        public List<string> quantity = new List<string>();
        public List<string> atc_id = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["login"] == null)
            {
				Response.Redirect("Login.aspx");
            }
            else
            {
                lblusername.Text = Session["username"].ToString();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
            getatc_id();
            getimage();
            getdishname();
            getprice();
            getquantity();
		}
        public void getatc_id()
        {
            con.Open();
            string query = "select atc_id from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                atc_id.Add((dr["atc_id"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getquantity()
        {
            con.Open();
            string query = "select quantity from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                quantity.Add((dr["quantity"]).ToString());
            }
            dr.Close();
            con.Close();
        }
        public void getimage()
        {
            con.Open();
            string did = "select d_id from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(did, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                string img = "select image from dishes where d_id = " + dr["d_id"].ToString();
                SqlCommand cmd1 = new SqlCommand(img, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while(dr1.Read())
                {
                    image.Add((dr1["image"]).ToString());
                }
            }
            con.Close();
        }
        public void getdishname()
        {
            con.Open();
            string did = "select d_id from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(did, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string img = "select dishname from dishes where d_id = " + dr["d_id"].ToString();
                SqlCommand cmd1 = new SqlCommand(img, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    dishname.Add((dr1["dishname"]).ToString());
                }
            }
            con.Close();
        }
        public void getprice()
        {
            con.Open();
            string did = "select d_id from [add_to_cart] where [r_id] = " + Session["rid"].ToString();
            SqlCommand cmd = new SqlCommand(did, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string img = "select price from dishes where d_id = " + dr["d_id"].ToString();
                SqlCommand cmd1 = new SqlCommand(img, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    price.Add((dr1["price"]).ToString());
                }
            }
            con.Close();
        }
    }
}