<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="Asp_DotNet_Project.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .stylish-form {
        background: linear-gradient(135deg, #fdfbfb, #ebedee);
    }

    .text-gradient {
        background: linear-gradient(45deg, #0072ff, #00c6ff);
        -webkit-text-fill-color: transparent;
    }

    .input-group-text {
        background: #f8f9fa;
        border-right: 0;
    }

    .form-control:focus {
        border-color: #00c6ff;
        box-shadow: 0 0 8px rgba(0, 198, 255, 0.4);
    }

    .btn-gradient {
        background: linear-gradient(45deg, #0072ff, #00c6ff);
        color: white;
        border: none;
        padding: 12px;
        font-size: 18px;
        border-radius: 8px;
        transition: 0.3s;
    }

    .btn-gradient:hover {
        background: linear-gradient(45deg, #00c6ff, #0072ff);
        transform: scale(1.05);
    }
</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card shadow-lg rounded-4 border-0 p-5 stylish-form">
                <h2 class="text-center mb-4 fw-bold"> User Registration </h2>

                <h4> <asp:Label ID="txtMsg" runat="server" CssClass="fw-bold text-success"></asp:Label></h4>

                <div class="row g-4">
                    <!-- First Name -->
                    <div class="col-md-4">
                        <label class="form-label fw-semibold">First Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" placeholder="Enter first name"></asp:TextBox>

                        </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtFName" ErrorMessage="First name is required"
                            CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Last Name -->
                    <div class="col-md-4">
                        <label class="form-label fw-semibold">Last Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control" placeholder="Enter last name"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator CssClass="text-danger small" ID="RequiredFieldValidator2" ControlToValidate="txtLName" runat="server" ErrorMessage="Last name is required"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Username -->
                    <div class="col-md-4">
                        <label class="form-label fw-semibold">Username</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-at"></i></span>
                            <asp:TextBox ID="txtUName" runat="server" CssClass="form-control" placeholder="Choose a username"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator CssClass="text-danger small" ID="RequiredFieldValidator3" ControlToValidate="txtUName" runat="server" ErrorMessage="User name is required"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Email -->
                    <div class="col-md-4">
                        <label class="form-label fw-semibold">Email</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
                        </div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger small" runat="server" ErrorMessage="Please enter a valid email address."></asp:RegularExpressionValidator>
                    </div>

                    <!-- Phone -->
                    <div class="col-md-4">
                        <label class="form-label fw-semibold">Phone</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter phone"></asp:TextBox>
                        </div>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtPhone" ValidationExpression="^\d{10}$" CssClass="text-danger small" runat="server" ErrorMessage="Please enter a valid 10-digit phone number."></asp:RegularExpressionValidator>
                    </div>

                    <!-- Age -->
                    <div class="col-md-4">
                        <label class="form-label fw-semibold">Age</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter age"></asp:TextBox>
                        </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtAge" CssClass="text-danger small" runat="server" ErrorMessage="Age is required"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Password -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                            <asp:TextBox ID="txtCPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter password"></asp:TextBox>
                        </div>
                        <asp:CompareValidator ID="CompareValidator1" CssClass="text-danger small" runat="server" ErrorMessage="Confirm password must match the password." ControlToCompare="txtPass" ControlToValidate="txtCPass"></asp:CompareValidator>
                    </div>

                    <!-- Address -->
                    <div class="col-md-12">
                        <label class="form-label fw-semibold">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="Enter address"></asp:TextBox>
                    </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAddress" CssClass="text-danger small" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>

                    <!-- Gender -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Gender</label><br>
                        <asp:RadioButton ID="rbMale" runat="server" GroupName="q" Text=" Male" CssClass="me-3" />
                        <asp:RadioButton ID="rbFemale" runat="server" GroupName="q" Text=" Female" />
                    </div>

                    <!-- Languages -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Languages Known</label><br>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text=" English" CssClass="me-3" />
                        <asp:CheckBox ID="CheckBox2" runat="server" Text=" Hindi" CssClass="me-3" />
                        <asp:CheckBox ID="CheckBox3" runat="server" Text=" Marathi" />
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="d-grid mt-4">
                    <asp:Button CssClass="btn btn-gradient fw-bold" ID="Button1" runat="server" Text="Register Now " OnClick="Button1_Click" />
                </div>
                <br />
                <div>
                    <a href="Login.aspx" class="mt-3 text-decoration-none">Already Register?  <span class="fw-semibold">Click Hear..</span></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Custom CSS -->



</asp:Content>
