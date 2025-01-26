<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommercewebapp.DTO.OrderDetailDTO" %><%--
  Created by IntelliJ IDEA.
  User: kavin
  Date: 1/26/2025
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PlaceOrder Table</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
<div class="container mt-5">
    <h2 class="mb-4">PlaceOrder Table</h2>
    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>OrderID</th>
            <th>CustomerID</th>
            <th>ProductID</th>
            <th>Quantity</th>
            <th>Total ($)</th>
        </tr>
        </thead>

        <%
            List<OrderDetailDTO> orderDetails = (List<OrderDetailDTO>) request.getAttribute("orderDetailsList");
            System.out.println(orderDetails.size()+"hhhhhh");
            if (orderDetails != null && !orderDetails.isEmpty()) {
                System.out.println("not Null");
                for (OrderDetailDTO orderDetail : orderDetails) {
        %>


        <tbody>
        <tr>
            <td><%= orderDetail.getOrderId() %></td>
            <td><%= orderDetail.getUid() %></td>
            <td><%= orderDetail.getProductId() %></td>
            <td><%= orderDetail.getQuantity() %></td>
            <td><%= orderDetail.getTotal() %></td>
        </tr>
        </tbody>
        <%
                }
            }else{
                    System.out.println("Order List Null");
                }
            %>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

