<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Asp_DotNet_Project.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card{
            height:500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex justify-content-center align-items-center">
        <div class=" shadow-lg rounded-4 p-4" style="max-width: 400px; width: 100%;">
            <div class="text-center">
                <h2 class="mb-4">Login</h2>

                <asp:Label CssClass="text-danger fw-bold d-block mb-3" ID="lblMessage" runat="server"></asp:Label>

                <div class="mb-3 text-start">
                    <asp:Label ID="lblUsername" CssClass="form-label fw-semibold" runat="server" Text="Username"></asp:Label>
                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Enter your username"></asp:TextBox>
                </div>

                <div class="mb-3 text-start">
                    <asp:Label ID="lblPassword" CssClass="form-label fw-semibold" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>

                <div class="mb-3 text-start">
                    <asp:Label ID="Label1" CssClass="form-label fw-semibold" runat="server" Text="Login Type"></asp:Label>


                    <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-control w-100">
                        <asp:ListItem Value="0">Select Login Type</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>User</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserType is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlLoginType"></asp:RequiredFieldValidator>
                </div>



                <div class="d-grid mb-3">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-primary btn-lg rounded-pill shadow-sm mt-2" />
                </div>

                <a href="UserRegistration.aspx" class="d-block mt-2 text-decoration-none">New User? <span class="fw-semibold">Register here</span></a>
            </div>
        </div>
    </div>


</asp:Content>
