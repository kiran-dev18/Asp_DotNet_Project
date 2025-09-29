using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project
{
    public partial class hotel_registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    lblWelcome.Text = Session["Username"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx"); 
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = lblWelcome.Text;
            string roomType = ddlRoom.SelectedValue;
            DateTime checkInDate = DateTime.Parse(txtCheckIn.Text);
            DateTime checkOutDate = DateTime.Parse(txtCheckOut.Text);

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;Integrated security=yes");
            con.Open();
            string query = "INSERT INTO HotelBooking (UserName, RoomType, CheckInDate, CheckOutDate)  VALUES (@UserName, @RoomType, @CheckInDate, @CheckOutDate)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserName",username );
            cmd.Parameters.AddWithValue("@RoomType",roomType );
            cmd.Parameters.AddWithValue("@CheckInDate",checkInDate);
            cmd.Parameters.AddWithValue("@CheckOutDate", checkOutDate);
            int rows = cmd.ExecuteNonQuery();
            con.Close();
            if (rows > 0)
            {
                lblMessage.Text = "Booking Registered Successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Booking Failed!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }



        }
    }
}