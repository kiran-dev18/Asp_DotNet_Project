<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hoteldetails.aspx.cs" Inherits="Asp_DotNet_Project.hoteldetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            
            background: #f5f5f5;
            
        }

        .grid-container {
            width: 80%;
            margin: auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

            .grid th, .grid td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: center;
            }

            .grid th {
                background: #007BFF;
                color: white;
            }
    </style>
    <style>
        .styled-grid {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Segoe UI', Arial, sans-serif;
            font-size: 1em;
            background: #fff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.07);
            margin-top: 16px;
        }

            .styled-grid th {
                background: linear-gradient(90deg, #5e60ce 0%, #3f37c9 100%);
                color: #fff;
                padding: 12px 8px;
                border: 1px solid #3f37c9;
                font-weight: 600;
                font-size: 1.05em;
                text-align: left;
            }

            .styled-grid td {
                padding: 10px 8px;
                border: 1px solid #e0e0e0;
                color: #222;
                background: #fafaff;
            }

            .styled-grid tr:nth-child(even) td {
                background: #f1f3fa;
            }

            .styled-grid tr:hover td {
                background: #dbe2fa;
                cursor: pointer;
            }

            .styled-grid a {
                color: #3f37c9;
                font-weight: 500;
                text-decoration: underline;
                transition: color 0.2s;
            }

                .styled-grid a:hover {
                    color: #5e60ce;
                }

        .gridTextbox {
            width: 95%; 
            box-sizing: border-box;
            padding: 4px;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
        <h2>All Hotel Bookings</h2>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID"
            CssClass="styled-grid" CellPadding="10" GridLines="None" OnRowDeleting="GridView1_RowDeleting1" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("BookingID") %>'
                            Text="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this booking?');"
                            CssClass="btn fw-bold text-black btn-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Booking ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" CssClass="gridTextbox" runat="server" Text='<%# Bind("BookingID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookingID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" CssClass="gridTextbox" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Room Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" CssClass="gridTextbox" runat="server" Text='<%# Bind("RoomType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("RoomType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Check-In Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" CssClass="gridTextbox" runat="server" Text='<%# Bind("CheckInDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("CheckInDate", "{0:dd-MM-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Check-Out Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" CssClass="gridTextbox" runat="server" Text='<%# Bind("CheckOutDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CheckOutDate", "{0:dd-MM-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Created At">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" CssClass="gridTextbox" runat="server" Text='<%# Bind("CreatedAt", "{0:dd-MM-yyyy HH:mm}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("CreatedAt", "{0:dd-MM-yyyy HH:mm}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>


   
</asp:Content>
