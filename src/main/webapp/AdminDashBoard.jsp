<%--
  Created by IntelliJ IDEA.
  User: kavin
  Date: 1/20/2025
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* Custom CSS for Navbar */
        .navbar {
            background-color: #f8f9fa;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #0048ba;
        }

        .nav-link {
            font-size: 16px;
            color: #333 !important;
            margin-right: 15px;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #0048ba !important;
        }
        #dashboard{
            margin-left: -220px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <!-- Brand -->
        <a class="navbar-brand" href="#">LaptopWorld</a>

        <!-- Toggler (for mobile screens) -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Content -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Navigation Links -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user-manage">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category-manage">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="getallcategory">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="getAllOrders">View Orders</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

    </div>

    <!-- Dashboard Cards -->
    <div id="dashboard" class="row mb-4">
        <h1 class="h2">Welcome, Admin</h1>
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">

                <div class="card-body">
                    <h5 class="card-title">Total Users</h5>
                    <p class="card-text">12</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Orders</h5>
                    <p class="card-text">05</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Products</h5>
                    <p class="card-text">60</p>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
