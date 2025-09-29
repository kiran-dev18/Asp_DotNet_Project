using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project
{
    public partial class hoteldetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }
        private void LoadBookings()
        {
            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            SqlCommand cmd = new SqlCommand("SELECT BookingID, UserName, RoomType, CheckInDate, CheckOutDate, CreatedAt FROM HotelBooking", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from HotelBooking where BookingID=@BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", id);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            LoadBookings();


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadBookings();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadBookings();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox t1 = (TextBox)row.FindControl("TextBox1");
            TextBox t2 = (TextBox)row.FindControl("TextBox2");
            TextBox t3 = (TextBox)row.FindControl("TextBox3");
            TextBox t4 = (TextBox)row.FindControl("TextBox4");
            TextBox t5 = (TextBox)row.FindControl("TextBox5");
            TextBox t6 = (TextBox)row.FindControl("TextBox6");
            

            DateTime CheckIn, CheckOut, CreatedAt;

            if (!DateTime.TryParseExact(t4.Text, "dd-MM-yyyy",
                System.Globalization.CultureInfo.InvariantCulture,
                System.Globalization.DateTimeStyles.None, out CheckIn))
            {
               
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Invalid Check-In Date format. Please use dd-MM-yyyy.');", true);
                return;
            }

            
            if (!DateTime.TryParseExact(t5.Text, "dd-MM-yyyy",
                System.Globalization.CultureInfo.InvariantCulture,
                System.Globalization.DateTimeStyles.None, out CheckOut))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Invalid Check-Out Date format. Please use dd-MM-yyyy.');", true);
                return;
            }

            
            if (!DateTime.TryParseExact(t6.Text, "dd-MM-yyyy HH:mm",
                System.Globalization.CultureInfo.InvariantCulture,
                System.Globalization.DateTimeStyles.None, out CreatedAt))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Invalid CreatedAt format. Please use dd-MM-yyyy HH:mm.');", true);
                return;
            }


            SqlConnection con = new SqlConnection("data source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            con.Open();
            var query = "update HotelBooking set UserName=@UserName,RoomType=@RoomType,CheckInDate=@CheckInDate,CheckOutDate=@CheckOutDate,CreatedAt=@CreatedAt where BookingID=@BookingID";
            SqlCommand cmd = new SqlCommand(@query, con);
            cmd.Parameters.AddWithValue("@BookingID", t1.Text);
            cmd.Parameters.AddWithValue("@UserName", t2.Text);
            cmd.Parameters.AddWithValue("@RoomType", t3.Text);
            cmd.Parameters.AddWithValue("@CheckInDate", CheckIn);
            cmd.Parameters.AddWithValue("@CheckOutDate", CheckOut);
            cmd.Parameters.AddWithValue("@CreatedAt", CreatedAt);


            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;
            LoadBookings();
        }
    }
}