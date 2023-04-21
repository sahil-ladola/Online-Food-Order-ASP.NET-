using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace FOODIVE.Visitor
{
    public partial class index : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        public List<string> title = new List<string>();
        public List<string> rest_id = new List<string>();
        public List<string> image = new List<string>();
        public List<string> address = new List<string>();
        public List<string> city = new List<string>();
        public List<string> pincode = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void GetData()
        {
            using (var con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT TOP 3 rest_id, title, image, address, city, pincode FROM restro";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    rest_id.Add(dr["rest_id"].ToString());
                    title.Add(dr["title"].ToString());
                    image.Add(dr["image"].ToString());
                    address.Add(dr["address"].ToString());
                    city.Add(dr["city"].ToString());
                    pincode.Add(dr["pincode"].ToString());
                }

                dr.Close();
            }
        }
    }
}
