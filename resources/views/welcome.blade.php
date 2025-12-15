<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopinkarts - Launch Your Zero-Risk Online Business</title>

    <link rel="icon" type="image/x-icon" href="{{ asset('public/images/logo.png') }}"> 
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        /* Advanced Blue Color Palette */
        :root {
            --deep-blue: #003366;       /* Primary Brand Color: Deep Navy */
            --sky-blue: #3399ff;        /* Secondary/Highlight Color: Sky Blue */
            --accent-blue: #007bff;     /* Tertiary/Button Accent Blue */
            --light-bg: #f5faff;        /* Very light background */
            --text-dark: #1a1a1a;
        }

        /* General Styling with Subtle Gradient */
        body {
            /* Subtle overall body gradient for depth */
            background: linear-gradient(to bottom, var(--light-bg), #e8f3ff);
            min-height: 100vh;
            color: var(--text-dark);
            scroll-behavior: smooth; /* Ensure smooth scrolling for "Go to Top" */
        }

        /* Custom Primary Button Style with Gradient */
        .btn-shopinkarts-primary {
            background: linear-gradient(45deg, var(--accent-blue), var(--sky-blue));
            border: none;
            color: white;
            font-weight: 700;
            padding: 0.75rem 2rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
        }
        .btn-shopinkarts-primary:hover {
            background: linear-gradient(45deg, var(--sky-blue), var(--accent-blue));
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 123, 255, 0.6);
            color: white;
        }

        /* Outline Button Style */
        .btn-outline-light-blue {
            color: white;
            border-color: white;
            font-weight: 700;
            transition: all 0.3s ease;
        }
        .btn-outline-light-blue:hover {
            background-color: white;
            color: var(--deep-blue);
        }

        /* Navbar/Branding */
        .navbar-brand {
            font-weight: 800;
            color: var(--deep-blue) !important;
            font-size: 1.5rem; /* Slightly reduced for better mobile fit */
        }
        .navbar-brand img {
            height: 40px; /* Smaller logo on all devices */
            width: 40px;
            margin-right: 0.5rem;
        }

        /* Hero Section Styling with Radial Gradient */
        .hero-section {
            background: radial-gradient(circle at center, #66b2ff, var(--deep-blue)); 
            color: white;
            padding: 5rem 0; /* Reduced padding for mobile */
            min-height: 70vh; /* Reduced min-height for mobile */
            display: flex;
            align-items: center;
        }
        .hero-title {
            font-size: 2.5rem; /* Mobile font size */
            font-weight: 900;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* Feature Cards Styling */
        .feature-icon {
            font-size: 3rem; /* Adjusted icon size */
            color: var(--accent-blue);
            margin-bottom: 1rem;
        }
        .feature-card {
            border: 1px solid #e0eaff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 51, 102, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            background-color: white;
        }
        .feature-card:hover {
            transform: translateY(-5px); /* Slightly less dramatic lift */
            box-shadow: 0 10px 25px rgba(0, 51, 102, 0.2);
            border: 1px solid var(--accent-blue);
        }
        
        /* Footer Styling */
        .footer-link {
            color: #b3ccff;
            text-decoration: none;
            transition: color 0.3s;
        }
        .footer-link:hover {
            color: var(--sky-blue);
        }

        /* 🌟 Go to Top Button Styling 🌟 */
        #scrollToTopBtn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1050; /* Above most fixed elements */
            display: none; /* Initially hidden by default */
            width: 50px;
            height: 50px;
            border-radius: 50%;
            padding: 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            background-color: var(--sky-blue);
            border: 1px solid white;
        }
        #scrollToTopBtn:hover {
            background-color: var(--accent-blue);
        }
        #scrollToTopBtn i {
            font-size: 1.5rem;
        }

        /* 🌟 Media Query for Tablet/Desktop (>= 768px) 🌟 */
        @media (min-width: 768px) {
            .hero-section {
                padding: 8rem 0;
                min-height: 85vh;
            }
            .hero-title {
                font-size: 4.5rem; /* Larger title for desktop */
            }
            .navbar-brand {
                font-size: 1.75rem;
            }
            .navbar-brand img {
                height: 60px;
                width: 60px;
            }
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#top">
                <img src="{{ asset('public/images/logo.png') }}" alt="Shopinkarts Logo"/> Shopinkarts
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-lg-center">
                    <li class="nav-item">
                        <a class="nav-link text-dark fw-medium" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fw-medium" href="{{ route('login') }}">Seller Program</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fw-medium" href="#">Contact</a>
                    </li>
                    <li class="nav-item ms-lg-3 my-2 my-lg-0">
                        <a class="btn btn-shopinkarts-primary fw-bold w-100 w-lg-auto" href="{{ route('login') }}">
                            Start Selling Today
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="hero-section flex-grow-1" id="top">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-10 mx-auto text-center"> 
                    <h1 class="hero-title mb-4">
                        Launch Your <span style="color: var(--sky-blue);">Zero-Risk</span> Online Business
                    </h1>
                    <h2>
By the vision and leadership of <h1> Anubhav Singh</h1>

                    </h2>
                    <p class="lead mb-5 fs-6 fs-md-5 px-3">
                        Your smart supply-chain partner for <b><span style='font-size:20px' >Meesho</span></b>, Amazon, Flipkart & all major marketplaces. Instant inventory. Guaranteed same-day dispatch.
                    </p>
                    <div class="d-grid gap-3 d-md-block"> 
                        <a href="{{ route('login') }}" class="btn btn-lg btn-shopinkarts-primary me-md-3 mb-3 mb-md-0">
                            Join the Seller Partner Program
                        </a>
                        <a href="#features" class="btn btn-lg btn-outline-light-blue">
                            Learn How It Works
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <main class="flex-shrink-0">
        <section id="features" class="container py-5">
            <h2 class="text-center mb-5 fw-bold display-6 display-md-5" style="color: var(--deep-blue);">The Shopinkarts Advantage</h2>
            <div class="row text-center">
                
                <div class="col-md-4 mb-4">
                    <div class="card feature-card p-4 h-100">
                        <div class="card-body">
                            <i class="bi bi-graph-up-arrow feature-icon"></i>
                            <h5 class="card-title fw-bold" style="color: var(--deep-blue);">Stable Monthly Profit</h5>
                            <p class="card-text text-muted">Achieve predictable returns of 7–12% monthly through our optimized operational model.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card feature-card p-4 h-100">
                        <div class="card-body">
                            <i class="bi bi-box-seam feature-icon"></i>
                            <h5 class="card-title fw-bold" style="color: var(--deep-blue);">Zero Inventory Risk</h5>
                            <p class="card-text text-muted">Buy only when orders come. Eliminate dead stock, warehouse costs, and locking up capital.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card feature-card p-4 h-100">
                        <div class="card-body">
                            <i class="bi bi-clock feature-icon"></i>
                            <h5 class="card-title fw-bold" style="color: var(--deep-blue);">Guaranteed Same-Day Dispatch</h5>
                            <p class="card-text text-muted">Orders placed before 3 PM are dispatched instantly, leading to fewer returns and higher marketplace ratings.</p>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section id="cta" class="mid-cta text-black text-center py-5 mb-0">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2 class="fw-bold mb-3 fs-3 fs-md-2">Ready to join India's #1 Zero-Risk Brand?</h2>
                        <p class="lead mb-4">Scale effortlessly with our smart supply chain and dedicated seller support.</p>
                        <a href="#" class="btn btn-lg btn-shopinkarts-primary">View Partnership Plans</a>
                    </div>
                </div>
            </div>
        </section>

    </main>

    <footer class="py-5" style="background-color: var(--deep-blue) !important;">
        <div class="container">
            <div class="row">
                
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5 class="fw-bold mb-3" style="color: var(--sky-blue);">Shopinkarts</h5>
                    <p class="text-white-50">Your reliable partner for scaling your e-commerce business across all major platforms with zero inventory risk.</p>
                    <div class="mt-3">
                        <a href="#" class="text-white me-3"><i class="bi bi-facebook fs-4"></i></a>
                        <a href="#" class="text-white me-3"><i class="bi bi-twitter fs-4"></i></a>
                        <a href="#" class="text-white"><i class="bi bi-linkedin fs-4"></i></a>
                    </div>
                </div>

                <div class="col-md-2 col-6">
                    <h6 class="fw-bold mb-3" style="color: var(--accent-blue);">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><a href="#top" class="footer-link">Home</a></li>
                        <li><a href="#features" class="footer-link">Features</a></li>
                        <li><a href="#" class="footer-link">Pricing</a></li>
                        <li><a href="#" class="footer-link">FAQs</a></li>
                    </ul>
                </div>

                <div class="col-md-3 col-6">
                    <h6 class="fw-bold mb-3" style="color: var(--accent-blue);">Seller Program</h6>
                    <ul class="list-unstyled">
                        <li><a href="{{ route('login') }}" class="footer-link">Become a Partner</a></li>
                        <li><a href="{{ route('login') }}" class="footer-link">Seller Dashboard</a></li>
                        <li><a href="#" class="footer-link">Marketplace Integrations</a></li>
                        <li><a href="#" class="footer-link">Success Stories</a></li>
                    </ul>
                </div>
                
                <div class="col-md-3 mt-4 mt-md-0">
                    <h6 class="fw-bold mb-3" style="color: var(--accent-blue);">Legal & Support</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="footer-link">Terms of Use</a></li>
                        <li><a href="#" class="footer-link">Privacy Policy</a></li>
                        <li><a href="#" class="footer-link">Refund Policy</a></li>
                        <li><a href="#" class="footer-link">Contact Us</a></li>
                    </ul>
                </div>

            </div>

            <hr class="my-4" style="border-color: #004488;">
            
            <div class="row">
                <div class="col-12 text-center text-white-50">
                    <p class="mb-0">&copy; 2025 Shopinkarts. All rights reserved. | <span style="color: var(--sky-blue);">E-commerce Simplified.</span></p>
                </div>
            </div>
        </div>
    </footer>

    <button type="button" class="btn btn-secondary" id="scrollToTopBtn" aria-label="Go to Top">
        <i class="bi bi-arrow-up text-white"></i>
    </button>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const scrollToTopBtn = document.getElementById('scrollToTopBtn');

            // Show or hide the button based on scroll position
            window.onscroll = function() {
                if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                    scrollToTopBtn.style.display = "block";
                } else {
                    scrollToTopBtn.style.display = "none";
                }
            };

            // Smooth scroll when the button is clicked
            scrollToTopBtn.addEventListener('click', function() {
                // Check for smooth scroll behavior in CSS (added to body style)
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        });
    </script>
    
</body>
</html>