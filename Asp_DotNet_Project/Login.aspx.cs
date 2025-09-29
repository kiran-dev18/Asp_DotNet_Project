using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp_DotNet_Project
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            
            try
            {
                if (ddlLoginType.SelectedValue == "Admin")
                {
                    username = ConfigurationManager.AppSettings["username"];
                    password = ConfigurationManager.AppSettings["password"];
                    if (username == txtUsername.Text.Trim() && password == txtPassword.Text.Trim())
                    {
                        Session["admin"] = username;
                        Response.Redirect("./Admin/AdminDashboard.aspx", false);
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Admin or password!";
                        lblMessage.CssClass = "text-danger fw-bold";
                    }

                }
                else
                {
                    using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-4EGG3EQ\\MSSQLSERVER01;database=AspProject;Integrated Security=True"))
                    {
                        con.Open();
                        string query = "SELECT Username FROM Registration WHERE Username = @Username AND Password = @Password";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.HasRows)
                        {
                            Session["Username"] = username;
                            Response.Redirect("hotel_registration.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username or password!";
                            lblMessage.CssClass = "text-danger fw-bold";
                        }

                        dr.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
               
            }
        }

    }
    }
