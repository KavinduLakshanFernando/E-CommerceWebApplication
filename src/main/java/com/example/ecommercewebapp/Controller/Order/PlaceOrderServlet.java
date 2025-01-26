package com.example.ecommercewebapp.Controller.Order;

import com.example.ecommercewebapp.DTO.OrderDto;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "placeOrder", value = "/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get parameters from the request
        String userId = req.getParameter("uid");
        String productId = req.getParameter("pid");
        String quantityStr = req.getParameter("qty");
        String totalStr = req.getParameter("total");
        String priceStr = req.getParameter("price");

        // Validate and parse the inputs
        try {
            int userIdParsed = Integer.parseInt(userId);
            int productIdParsed = Integer.parseInt(productId);
            int quantity = Integer.parseInt(quantityStr);
            double total = Double.parseDouble(totalStr);
            int price = (int) Double.parseDouble(priceStr); // Convert price to integer

            int orderId = generateOrderId();

            System.out.println(userId + " " + productId + " " + quantity + " " + total + " " + price + " " + orderId);

            ServletContext servletContext = getServletContext();
            BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

            try (Connection connection = ds.getConnection()) {
                connection.setAutoCommit(false); // Start transaction

                try {
                    // Create order object
                    OrderDto order = new OrderDto(orderId, userIdParsed, total);

                    // Insert order
                    boolean isOrderInserted = insertOrder(connection, order);
                    if (isOrderInserted) {
                        System.out.println("Order saved.");

                        // Insert order detail
                        boolean isOrderDetailInserted = insertOrderDetail(connection, orderId, productIdParsed, quantity, price);
                        if (isOrderDetailInserted) {
                            System.out.println("Order detail saved.");

                            // Update product quantity
                            boolean isProductUpdated = updateProductQuantity(connection, productIdParsed, quantity);
                            if (isProductUpdated) {
                                System.out.println("Product updated.");
                                connection.commit(); // Commit transaction
                                req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
                                return;
                            } else {
                                System.out.println("Product update failed.");
                                connection.rollback();
                            }
                        } else {
                            System.out.println("Order detail insertion failed.");
                            connection.rollback();
                        }
                    } else {
                        System.out.println("Order insertion failed.");
                        connection.rollback();
                    }
                } catch (SQLException e) {
                    connection.rollback(); // Rollback transaction on error
                    throw e;
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input format.");
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred while processing the order.");
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
        }
    }

    private boolean insertOrder(Connection connection, OrderDto order) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO orders (id, user_id, total) VALUES (?, ?, ?)")) {
            preparedStatement.setInt(1, order.getOid());
            preparedStatement.setInt(2, order.getUid());
            preparedStatement.setDouble(3, order.getTotal());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean insertOrderDetail(Connection connection, int orderId, int productId, int quantity, int price) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO orderdetail (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)")) {
            preparedStatement.setInt(1, orderId);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setInt(4, price);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updateProductQuantity(Connection connection, int productId, int quantity) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE products SET quantity = quantity - ? WHERE id = ?")) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, productId);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private int generateOrderId() {
        try {
            String currentId = getCurrenteId();
            return generateNextOrderId(currentId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private int generateNextOrderId(String currentId) {
        if (currentId != null) {
            int currentIdInt = Integer.parseInt(currentId);
            return ++currentIdInt;
        }
        return 1;
    }

    public String getCurrenteId() throws SQLException {
        String sql = "SELECT max(id) FROM orders";
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try (Connection connection = ds.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getString(1);
            }
            return null;
        }
    }
}
