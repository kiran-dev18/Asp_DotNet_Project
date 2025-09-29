<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Asp_DotNet_Project.Admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Sidebar */
        .sidebar {
            background: #4B0082;
            height: 100vh;
            padding-top: 20px;
            position: fixed;
            width: 220px;
            color: white;
        }

            .sidebar a {
                display: block;
                padding: 12px 20px;
                color: #fff;
                text-decoration: none;
                font-weight: 500;
                border-radius: 8px;
                margin: 6px 0;
                transition: all 0.3s ease;
            }

                .sidebar a:hover {
                    background: #6A0DAD;
                }

            .sidebar .logout {
                background: #ff4d4d;
                text-align: center;
                margin-top: 20px;
            }
        /* Content */
        .main-content {
            margin-left: 240px;
            padding: 20px;
        }
        /* Dashboard Cards */
        .dashboard-card {
            border-radius: 12px;
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            transition: transform 0.2s ease-in-out;
        }

            .dashboard-card:hover {
                transform: translateY(-5px);
            }

        .card1 {
            background: linear-gradient(135deg, #ff512f, #dd2476);
        }

        .card2 {
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .card3 {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
        }

        .card4 {
            background: linear-gradient(135deg, #36d1dc, #5b86e5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="fw-bold text-center">Dashboard</h2>
    <div class="row w-100 m-auto">
        <div class="col-md-4">
            <div class="card text-white shadow" style="background: linear-gradient(45deg, #ff4e50, #f9d423);">
                <div class="card-body text-center">
                    <h5>Total Users</h5>
                    <h3><%Response.Write(Session["TotalUser"]); %> </h3>
                    
                </div>
            </div>
        </div>
       <%-- <div class="col-md-3">
            <div class="card text-white shadow" style="background: linear-gradient(45deg, #56ab2f, #a8e063);">
                <div class="card-body text-center">
                    <h5>Total Rooms</h5>
                    <h3>0</h3>
                </div>
            </div>
        </div>--%>
        <div class="col-md-4">
            <div class="card text-white shadow" style="background: linear-gradient(45deg, #ff512f, #dd2476);">
                <div class="card-body text-center">
                    <h5>Total Bookings</h5>
                    <h3><%Response.Write(Session["TotalHotelBooking"]); %> </h3>
                    
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white shadow" style="background: linear-gradient(45deg, #36d1dc, #5b86e5);">
                <div class="card-body text-center">
                    <h5>Contacted Users</h5>
                    <h3><%Response.Write(Session["Contact"]); %> </h3>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
