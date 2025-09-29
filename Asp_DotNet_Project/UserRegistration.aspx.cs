using System;
using System.Collections.Generic;
using System.Data.SqlClient;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project
{
    public partial class UserRegistration : System.Web.UI.Page
    {
       

       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

       

       

        protected void Button1_Click1(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<string> lang = new List<string>();
            if (CheckBox1.Checked) lang.Add("English");
            if (CheckBox2.Checked) lang.Add("Hindi");
            if (CheckBox3.Checked) lang.Add("Marathi");


            string gender = "";
            if (rbMale.Checked)
            {
                gender = "Male";
            }
            else if (rbFemale.Checked)
            {
                gender = "Female";
            }

            string languages = string.Join(", ", lang);

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;Integrated security=yes");
            con.Open();
            string query = "INSERT INTO Registration (Username, Firstname, Lastname, Gender, Password, CPassword, Email , Phone, Age, Languages, Address) VALUES (@Username, @Firstname, @Lastname, @Gender, @Password, @CPassword, @Email , @Phone, @Age, @Languages, @Address)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Username", txtUName.Text);
            cmd.Parameters.AddWithValue("@Firstname", txtFName.Text);
            cmd.Parameters.AddWithValue("@Lastname", txtLName.Text);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Password", txtPass.Text);
            cmd.Parameters.AddWithValue("@CPassword", txtCPass.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Age", txtAge.Text);
            cmd.Parameters.AddWithValue("@Languages", languages);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            txtMsg.Text = "Rgistration Succesfull..!";
            txtUName.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtPass.Text = "";
            txtCPass.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAge.Text = "";
            txtAddress.Text = "";
            rbMale.Checked = false;
            rbFemale.Checked = false;
            CheckBox1.Checked = false;
            CheckBox2.Checked = false;
            CheckBox3.Checked = false;

        }
    }
}