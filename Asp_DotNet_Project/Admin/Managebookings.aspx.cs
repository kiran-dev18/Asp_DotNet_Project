using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project.Admin
{
    public partial class Managebookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }
        public void GetData()
        {
            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            SqlCommand cmd = new SqlCommand("select * from HotelBooking", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int bookingId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string userName = (row.FindControl("txtUser") as TextBox).Text;
            string roomType = (row.FindControl("txtRoom") as TextBox).Text;
            DateTime checkIn = Convert.ToDateTime((row.FindControl("txtCheckIn") as TextBox).Text);
            DateTime checkOut = Convert.ToDateTime((row.FindControl("txtCheckOut") as TextBox).Text);
            DateTime createdate = Convert.ToDateTime((row.FindControl("txtCreate") as TextBox).Text);

            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            string query = "UPDATE HotelBooking SET UserName=@UserName, RoomType=@RoomType, CheckInDate=@CheckIn, CheckOutDate=@CheckOut, CreatedAt=@CreatedAt WHERE BookingId=@BookingId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@RoomType", roomType);
            cmd.Parameters.AddWithValue("@CheckIn", checkIn);
            cmd.Parameters.AddWithValue("@CheckOut", checkOut);
            cmd.Parameters.AddWithValue("@CreatedAt", createdate);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            GetData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection("data source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM HotelBooking WHERE BookingID=@BookingID ", con);
                cmd.Parameters.AddWithValue("@BookingId", id);
                cmd.ExecuteNonQuery();
            }
            GetData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}