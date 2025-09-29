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
    public partial class ContactList : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from Contact", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Gridview1.DataSource = ds.Tables[0];
            Gridview1.DataBind();
        }

        protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = Gridview1.Rows[e.RowIndex];
            TextBox t = (TextBox)row.FindControl("TextBox");
            TextBox t1 = (TextBox)row.FindControl("TextBox2");
            TextBox t2 = (TextBox)row.FindControl("TextBox3");
            TextBox t3 = (TextBox)row.FindControl("TextBox4");
            TextBox t4 = (TextBox)row.FindControl("TextBox5");
            SqlConnection con = new SqlConnection("data source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes");
            con.Open();
            var query = "update Contact set fname=@fname,Email=@Email,message=@message,CreatedDate=@CreatedDate where Id=@Id";
            SqlCommand cmd = new SqlCommand(@query, con);
            cmd.Parameters.AddWithValue("@Id", t.Text);

            cmd.Parameters.AddWithValue("@fname", t1.Text);
            cmd.Parameters.AddWithValue("@Email", t2.Text);
            cmd.Parameters.AddWithValue("@message", t3.Text);
            cmd.Parameters.AddWithValue("@CreatedDate", t4.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Gridview1.EditIndex = -1;
            GetData();
        }

        protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection("data source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;integrated security=yes"))
            {
                con.Open();
                string query = "DELETE FROM Contact WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            GetData();
        }

        protected void Gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            GetData();
        }

        protected void Gridview1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridview1.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}