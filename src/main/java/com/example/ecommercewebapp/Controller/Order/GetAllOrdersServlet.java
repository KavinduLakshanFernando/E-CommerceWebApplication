package com.example.ecommercewebapp.Controller.Order;

import com.example.ecommercewebapp.DTO.OrderDetailDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetAllOrdersServlet", value = "/getAllOrders")
public class GetAllOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<OrderDetailDTO> orderDetailsList = new ArrayList<>();
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try (Connection connection = ds.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT orders.user_id, orderdetail.product_id, orders.id AS order_id, orderdetail.quantity, orders.total FROM orders JOIN orderdetail ON orders.id = orderdetail.order_id;");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                int productId = resultSet.getInt("product_id");
                int quantity = resultSet.getInt("quantity");
                double total = resultSet.getDouble("total");
                int userId = resultSet.getInt("user_id");

                OrderDetailDTO orderDetail = new OrderDetailDTO(quantity,productId,orderId, total, userId);
                orderDetailsList.add(orderDetail);

            }
            for (OrderDetailDTO orderDetail : orderDetailsList) {
                System.out.println(orderDetail.getOrderId() + " " + orderDetail.getProductId() + " " + orderDetail.getQuantity() + " " + orderDetail.getTotal() + " " + orderDetail.getUid());
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        req.setAttribute("orderDetailsList", orderDetailsList);
        req.getRequestDispatcher("LoadPlaceOrderData.jsp").forward(req, resp);
    }
    }
