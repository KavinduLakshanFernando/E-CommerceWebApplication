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

