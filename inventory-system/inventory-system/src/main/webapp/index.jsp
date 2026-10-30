<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Inventory Management System</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
    >

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f7fb;
            color: #212529;
        }

        /* Navbar */
        .custom-navbar {
            background-color: #172033;
            padding: 12px 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 19px;
            font-weight: 600;
            color: #ffffff;
        }

        .navbar-brand img {
            width: 65px;
            height: 55px;
            object-fit: contain;
        }

        .navbar-brand:hover {
            color: #ffffff;
        }

        .navbar-nav .nav-link {
            color: #e5e7eb;
            margin-left: 12px;
            transition: color 0.2s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #ffffff;
        }

        .menu-button {
            margin-left: 15px;
        }

        /* Sidebar */
        .offcanvas {
            background-color: #172033;
            color: #ffffff;
            width: 270px !important;
        }

        .offcanvas .btn-close {
            filter: invert(1);
        }

        .sidebar-link {
            display: block;
            padding: 12px 15px;
            margin-bottom: 8px;
            color: #d1d5db;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.2s ease, color 0.2s ease;
        }

        .sidebar-link:hover {
            background-color: #29364d;
            color: #ffffff;
        }

        /* Main content */
        .main-content {
            padding: 50px 20px;
            min-height: calc(100vh - 80px);
        }

        .welcome-section {
            max-width: 1100px;
            margin: 0 auto;
        }

        .welcome-title {
            font-size: clamp(28px, 4vw, 40px);
            font-weight: 700;
            margin-bottom: 15px;
            color: #172033;
        }

        .welcome-description {
            font-size: 17px;
            color: #6b7280;
            line-height: 1.8;
            max-width: 700px;
        }

        .action-card {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 25px;
            height: 100%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.04);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .action-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 22px rgba(0, 0, 0, 0.08);
        }

        .card-icon {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .action-card h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .action-card p {
            color: #6b7280;
            line-height: 1.6;
        }

        .footer {
            text-align: center;
            padding: 18px;
            color: #6b7280;
            background-color: #ffffff;
            border-top: 1px solid #e5e7eb;
        }

        @media (max-width: 576px) {
            .custom-navbar {
                padding: 10px 12px;
            }

            .navbar-brand {
                font-size: 15px;
                gap: 7px;
            }

            .navbar-brand img {
                width: 45px;
                height: 45px;
            }

            .menu-button {
                margin-left: 8px;
            }

            .main-content {
                padding: 35px 16px;
            }
        }
    </style>
</head>

<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">

    <div class="container-fluid">

        <!-- Brand and Logo -->
        <a class="navbar-brand" href="index.html">
            <img src="images/logo.png" alt="Inventory Management Logo">
            <span>Inventory Management</span>
        </a>

        <!-- Mobile Navbar Toggle -->
        <button
                class="navbar-toggler ms-auto"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation Links -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto align-items-lg-center">

                <li class="nav-item">
                    <a class="nav-link" href="Register">Register</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Login">Login</a>
                </li>

            </ul>

        </div>

        <!-- Sidebar Toggle -->
        <button
                class="btn btn-outline-light menu-button"
                type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#sidebar"
                aria-controls="sidebar"
                aria-label="Open menu"
        >
            ☰ Menu
        </button>

    </div>

</nav>


<!-- Sidebar -->
<div
        class="offcanvas offcanvas-start"
        tabindex="-1"
        id="sidebar"
        aria-labelledby="sidebarTitle"
>

    <div class="offcanvas-header">

        <h5 class="offcanvas-title" id="sidebarTitle">
            Inventory Menu
        </h5>

        <button
                type="button"
                class="btn-close"
                data-bs-dismiss="offcanvas"
                aria-label="Close"
        ></button>

    </div>

    <div class="offcanvas-body">

        <nav aria-label="Main menu">

            <a href="index.html" class="sidebar-link">
                🏠 Dashboard
            </a>

            <a href="Products" class="sidebar-link">
                📦 Products
            </a>

            <a href="Orders" class="sidebar-link">
                🛒 Orders
            </a>

            <a href="Reports" class="sidebar-link">
                📊 Reports
            </a>

            <hr class="border-secondary">

            <a href="Register" class="sidebar-link">
                👤 Register
            </a>

            <a href="Login" class="sidebar-link">
                🔐 Login
            </a>

        </nav>

    </div>

</div>


<!-- Main Content -->
<main class="main-content">

    <section class="welcome-section">

        <div class="mb-5">

            <h1 class="welcome-title">
                Welcome to Inventory Management
            </h1>

            <p class="welcome-description">
                Manage your inventory efficiently from one place.
                Organize products, track orders, and access reports
                through a simple and user-friendly interface.
            </p>

            <div class="mt-4">

                <a href="Login" class="btn btn-primary btn-lg me-2 mb-2">
                    Get Started
                </a>

                <a href="Register" class="btn btn-outline-primary btn-lg mb-2">
                    Create Account
                </a>

            </div>

        </div>


        <!-- Feature Cards -->
        <div class="row g-4">

            <div class="col-12 col-md-6 col-lg-4">

                <div class="action-card">

                    <div class="card-icon">📦</div>

                    <h5>Product Management</h5>

                    <p>
                        Organize product information and maintain
                        inventory records in one place.
                    </p>

                    <a href="Products" class="btn btn-outline-primary">
                        View Products
                    </a>

                </div>

            </div>


            <div class="col-12 col-md-6 col-lg-4">

                <div class="action-card">

                    <div class="card-icon">🛒</div>

                    <h5>Order Management</h5>

                    <p>
                        Keep track of orders and make inventory
                        operations easier to manage.
                    </p>

                    <a href="Orders" class="btn btn-outline-primary">
                        View Orders
                    </a>

                </div>

            </div>


            <div class="col-12 col-md-6 col-lg-4">

                <div class="action-card">

                    <div class="card-icon">📊</div>

                    <h5>Inventory Reports</h5>

                    <p>
                        Access inventory-related reports to help
                        understand your product records.
                    </p>

                    <a href="Reports" class="btn btn-outline-primary">
                        View Reports
                    </a>

                </div>

            </div>

        </div>

    </section>

</main>


<!-- Footer -->
<footer class="footer">
    <p class="mb-0">
        &copy; 2026 Inventory Management System. All rights reserved.
    </p>
</footer>


<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>