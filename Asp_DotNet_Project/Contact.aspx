<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Asp_DotNet_Project.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }

        .form-control {
            border-radius: 10px;
            padding: 10px;
        }

        .btn1 {
            border-radius: 10px;
            font-weight: 600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="text-center fw-bold mb-4" data-aos="fade-up">Contact Us</h2>
        <p class="text-center text-muted mb-5" data-aos="fade-up" data-aos-delay="200">
            Have questions? Reach out to us anytime, we’d love to hear from you.
        </p>

        <div class="row g-4">
            <asp:Label ID="mes" runat="server" CssClass="alert alert-success"></asp:Label>
            <!-- Contact Form -->
            <div class="col-md-6" data-aos="fade-right">
                <div class="card shadow-sm p-4 h-100">
                    <h4 class="mb-3">Send us a message</h4>
                    <asp:TextBox ID="txtName" CssClass="form-control mb-3" placeholder="Full Name" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" CssClass="form-control mb-3" placeholder="Email Address" TextMode="Email" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtMessage" CssClass="form-control mb-3" placeholder="Write your message" TextMode="MultiLine" Rows="4" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSubmit" CssClass="btn btn1 btn-primary w-100" Text="Send Message" runat="server" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <!-- Contact Info + Map -->
            <div class="col-md-6" data-aos="fade-left">
                <div class="card shadow-sm p-4 h-100">
                    <h4 class="mb-3">Our Location</h4>
                    <p><b>📍 Address:</b> 123 Main Street, Your City</p>
                    <p><b>📞 Phone:</b> +91 98765 43210</p>
                    <p><b>📧 Email:</b> contact@yourhotel.com</p>
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d121656.25694349922!2d75.83621374758096!3d17.661615751444433!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc5d082b54ac5d5%3A0x3c719de6c83710d0!2sSolapur%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1756665150746!5m2!1sen!2sin"
                        width="100%" height="250" style="border: 0; border-radius: 10px;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
