using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project.Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
               
            }
            
        }
        private void GetData()
        {
            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            SqlCommand cmd = new SqlCommand("select * from Registration", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            TextBox t2 = (TextBox)row.FindControl("txtFirstname");
            TextBox t3 = (TextBox)row.FindControl("txtLastName");
            TextBox t4 = (TextBox)row.FindControl("txtEmail");
            TextBox t5 = (TextBox)row.FindControl("txtPhone");
            TextBox t6 = (TextBox)row.FindControl("txtAddress");
            SqlConnection con = new SqlConnection("data source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            con.Open();
            var query = "update Registration set Firstname=@Firstname,Lastname=@Lastname,Email=@Email,Phone=@Phone,Address=@Address where Id=@Id";
            SqlCommand cmd = new SqlCommand(@query, con);
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@Firstname", t2.Text);
            cmd.Parameters.AddWithValue("@Lastname", t3.Text);
            cmd.Parameters.AddWithValue("@Email", t4.Text);
            cmd.Parameters.AddWithValue("@Phone", t5.Text);
            cmd.Parameters.AddWithValue("@Address", t6.Text);
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
                string query = "DELETE FROM Registration WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            GetData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}