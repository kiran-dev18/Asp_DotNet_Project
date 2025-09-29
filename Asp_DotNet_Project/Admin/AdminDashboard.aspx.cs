using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        //SqlConnection con;
        //SqlDataAdapter sda;
        //SqlCommand cmd;
        //DataTable dt;
        //string str = ConfigurationManager.ConnectionStrings["AspProjectConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ContactCount();
            Registration();
            HotelBooking();
        }
        private void ContactCount()
        {

           SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01; database = AspProject; integrated security = yes");
           SqlDataAdapter sda = new SqlDataAdapter("Select Count(*) from Contact", con);
           DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Contact"] = dt.Rows[0][0];
            }
            else
            {
                Session["Contact"] = 0;
            }

        }
        private void Registration()
        {
            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01; database = AspProject; integrated security = yes");
            SqlDataAdapter sda = new SqlDataAdapter("Select Count(*) from Registration", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["TotalUser"] = dt.Rows[0][0];
            }
            else
            {
                Session["TotalUser"] = 0;
            }
        }

        private void HotelBooking()
        {
            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01; database = AspProject; integrated security = yes");
            SqlDataAdapter sda = new SqlDataAdapter("Select Count(*) from HotelBooking", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["TotalHotelBooking"] = dt.Rows[0][0];
            }
            else
            {
                Session["TotalHotelBooking"] = 0;
            }
        }

    }
}