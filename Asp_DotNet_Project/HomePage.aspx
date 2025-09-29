<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Asp_DotNet_Project.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* General card style */
        .step-card {
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            color: #fff;
        }

            .step-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 30px rgba(0,0,0,0.25);
            }

            .step-card .icon {
                font-size: 2rem;
                background: rgba(255,255,255,0.2);
                color: #fff;
                width: 60px;
                height: 60px;
                line-height: 60px;
                border-radius: 50%;
                display: inline-block;
            }

        /* Unique Gradients for each step */
        .step-1 {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
        }

        .step-2 {
            background: linear-gradient(135deg, #ff512f, #dd2476);
        }

        .step-3 {
            background: linear-gradient(135deg, #11998e, #38ef7d);
        }

        .step-4 {
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #333; /* dark text for yellow background */
        }

            .step-4 .icon {
                background: rgba(0,0,0,0.2);
                color: #fff;
            }
    </style>

    <style>
        /* Gallery Styles */
        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 15px;
        }

            .gallery-item img {
                transition: transform 0.4s ease, filter 0.4s ease;
            }

            .gallery-item:hover img {
                transform: scale(1.1);
                filter: brightness(80%);
            }
    </style>

    <style>
        /* Hero Section Styles */
        .hero-section {
            position: relative;
            height: 85vh;
            background: url('https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg') no-repeat center center/;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0 0 50px 50px;
            overflow: hidden;
        }

            .hero-section .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.55); /* Dark overlay for readability */
            }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
        }

            .hero-content h1 {
                font-size: 3.2rem;
                font-weight: 700;
            }

            .hero-content p {
                font-size: 1.25rem;
                margin: 20px 0;
            }

            .hero-content .btn {
                border-radius: 30px;
                padding: 12px 30px;
                font-size: 1.1rem;
                transition: 0.3s;
            }

                .hero-content .btn:hover {
                    transform: scale(1.05);
                    box-shadow: 0 5px 20px rgba(0,0,0,0.3);
                }
    </style>
    <style>
        /* Base Card Style */
        .feature-card {
            color: #fff;
            padding: 25px;
            border-radius: 15px;
            border: none;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

            .feature-card h4 {
                font-weight: bold;
                margin-bottom: 15px;
            }

            .feature-card p {
                font-size: 0.95rem;
                opacity: 0.9;
            }

        /* Unique Gradients */
        .feature-1 {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .feature-2 {
            background: linear-gradient(135deg, #43cea2, #185a9d);
        }

        .feature-3 {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
        }

        .feature-4 {
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #333;
        }

        /* Hover Effects */
        .feature-card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
            filter: brightness(1.1);
        }
    </style>
    <style>
        img {
            height: 350px;
            background-size: cover;
        }
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            AOS.init({
                duration: 1000,   // animation duration
                once: true        // run only once
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <!-- Hero Section -->
    <div class="hero-section d-flex align-items-center justify-content-center text-center">
        <div class="overlay"></div>
        <div class="hero-content animate__animated animate__fadeInDown">
            <h1 class="display-4 fw-bold text-white">Welcome to Your Smart Hotel Booking</h1>
            <p class="lead mt-3 text-white">Register, Book, and Manage your stay with ease – anytime, anywhere.</p>
            <a href="hotel_registration.aspx" class="btn btn-primary btn-lg me-3 animate__animated animate__pulse animate__infinite">Book Now</a>
            <a href="UserRegistration.aspx" class="btn btn-success btn-lg">Register</a>
        </div>
    </div>

    <!-- Why Choose Us Section -->
    <div class="container my-5">
        <h2 class="text-center fw-bold mb-4" data-aos="fade-up">Why Choose Us?</h2>
        <div class="row g-4">
            <div class="col-md-3" data-aos="zoom-in">
                <div class="card feature-card feature-1 text-center h-100">
                    <h4>📝 Easy Registration</h4>
                    <p>Sign up in just a few clicks and get started right away.</p>
                </div>
            </div>
            <div class="col-md-3" data-aos="zoom-in" data-aos-delay="200">
                <div class="card feature-card feature-2 text-center h-100">
                    <h4>🛏 Quick Booking</h4>
                    <p>Book your hotel room in seconds with our simple interface.</p>
                </div>
            </div>
            <div class="col-md-3" data-aos="zoom-in" data-aos-delay="400">
                <div class="card feature-card feature-3 text-center h-100">
                    <h4>🔒 Secure Login</h4>
                    <p>Your data and booking information are safe with us.</p>
                </div>
            </div>
            <div class="col-md-3" data-aos="zoom-in" data-aos-delay="600">
                <div class="card feature-card feature-4 text-center h-100">
                    <h4>📊 Manage Bookings</h4>
                    <p>View, edit, or cancel reservations easily anytime.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- How It Works Section -->
    <div class="container my-5">
        <h2 class="text-center fw-bold mb-4" data-aos="fade-up">How It Works</h2>
        <div class="row g-4 text-center">

            <!-- Step 1 -->
            <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
                <div class="card step-card step-1 shadow-sm h-100 p-4">
                    
                    <h5 class="fw-bold">Register</h5>
                    <p class="text-muted">Create an account with simple details.</p>
                </div>
            </div>

            <!-- Step 2 -->
            <div class="col-md-3" data-aos="fade-up" data-aos-delay="200">
                <div class="card step-card step-2 shadow-sm h-100 p-4">
                    
                    <h5 class="fw-bold">Login</h5>
                    <p class="text-muted">Securely sign in with your credentials.</p>
                </div>
            </div>

            <!-- Step 3 -->
            <div class="col-md-3" data-aos="fade-up" data-aos-delay="300">
                <div class="card step-card step-3 shadow-sm h-100 p-4">
                    
                    <h5 class="fw-bold">Book Room</h5>
                    <p class="text-muted">Choose your room type and dates.</p>
                </div>
            </div>

            <!-- Step 4 -->
            <div class="col-md-3" data-aos="fade-up" data-aos-delay="400">
                <div class="card step-card step-4 shadow-sm h-100 p-4">
                    
                    <h5 class="fw-bold">Enjoy Stay</h5>
                    <p class="text-muted">Confirm booking and relax in comfort.</p>
                </div>
            </div>

        </div>
    </div>

    <!-- Gallery Section -->
    <div class="container my-5">
        <h2 class="text-center fw-bold mb-4" data-aos="fade-up">Our Hotel Gallery</h2>
        <div class="row g-4">

            <!-- Image 1 -->
            <div class="col-md-4 col-sm-6" data-aos="zoom-in">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80"
                        class="img-fluid rounded shadow-sm" alt="Luxury Room">
                </div>
            </div>

            <!-- Image 2 -->
            <div class="col-md-4 col-sm-6" data-aos="zoom-in" data-aos-delay="200">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=800&q=80"
                        class="img-fluid rounded shadow-sm" alt="Hotel Lobby">
                </div>
            </div>

            <!-- Image 3 -->
            <div class="col-md-4 col-sm-6" data-aos="zoom-in" data-aos-delay="400">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=80"
                        class="img-fluid rounded shadow-sm" alt="Swimming Pool">
                </div>
            </div>

            <!-- Image 4 -->
            <div class="col-md-4 col-sm-6" data-aos="zoom-in">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80"
                        class="img-fluid rounded shadow-sm" alt="Luxury Dining">
                </div>
            </div>

            <!-- Image 5 -->
            <div class="col-md-4 col-sm-6" data-aos="zoom-in" data-aos-delay="200">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80"
                        class="img-fluid rounded shadow-sm" alt="Hotel Room">
                </div>
            </div>

            <!-- Image 6 -->
            <div class="col-md-4 col-sm-6" data-aos="zoom-in" data-aos-delay="400">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=80"
                        class="img-fluid rounded shadow-sm" alt="Outdoor View">
                </div>
            </div>

        </div>
    </div>

</asp:Content>
