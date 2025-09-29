<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hotel_registration.aspx.cs" Inherits="Asp_DotNet_Project.hotel_registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            
        }

        .form-container {
            background: #fff;
            padding: 20px;
            width: 400px;
            margin: auto;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 12px;
        }

        label {
            display: block;
            margin-bottom: 6px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn1 {
            background: #007BFF;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
        }

           .btn1:hover {
                background: #0056b3;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="form-container">
        <h2>Hotel Registration</h2>
        <asp:Label ID="lblMessage" CssClass="fw-bold alert-success" runat="server" Text=""></asp:Label>
        <div class="form-group">
            <label for="txtName">
                User Name:
                <asp:Label ID="lblWelcome" runat="server" CssClass="h4 text-primary fw-bold"></asp:Label>
            </label>

        </div>
        <div class="form-group">
            <label for="ddlRoom">Room Type:</label>
            <asp:DropDownList ID="ddlRoom" runat="server">
                <asp:ListItem>Single</asp:ListItem>
                <asp:ListItem>Double</asp:ListItem>
                <asp:ListItem>Deluxe</asp:ListItem>
                <asp:ListItem>Suite</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtCheckIn">Check-In Date:</label>
            <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" />
        </div>
        <div class="form-group">
            <label for="txtCheckOut">Check-Out Date:</label>
            <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" />
        </div>
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn1 shadow" Text="Register" OnClick="btnSubmit_Click" />
    </div>

</asp:Content>
