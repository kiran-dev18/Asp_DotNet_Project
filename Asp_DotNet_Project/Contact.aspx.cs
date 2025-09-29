using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("data source = DESKTOP-4EGG3EQ\\MSSQLSERVER01; database = AspProject; integrated security = yes");
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Contact(fname,Email,message) values (@fname,@Email,@message)", con);
            cmd.Parameters.AddWithValue("@fname",txtName.Text);
            cmd.Parameters.AddWithValue("@Email",txtEmail.Text);
            cmd.Parameters.AddWithValue("@message",txtMessage.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            mes.Text = "Your message has been sent successfully!";
            
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
            

        }
    }
}