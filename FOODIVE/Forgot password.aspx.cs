using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace FOODIVE.Foodive
{
    public partial class Forgot_password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        static int sendOtp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (IsPostBack)
            {
                if (ViewState["txtCustEmail"] != null)
                {
                    txtCustomerEmail.Text = ViewState["txtCustEmail"].ToString();
                }
            }
        }

        protected void btnsendOTP_Click(object sender, EventArgs e)
        {
            
        }
    }
}