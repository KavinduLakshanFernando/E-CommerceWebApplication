package com.example.ecommercewebapp.Controller.Product;

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
import java.sql.SQLException;

@WebServlet(name = "UpdateProductServlet", value = "/product-update")
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("update post");
        int id = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("productName");
        String description = req.getParameter("productDescription");
        String price = req.getParameter("productPrice");
        int category = Integer.parseInt(req.getParameter("categoryId"));
        String quantity = req.getParameter("productQuantity");

        System.out.println(id + " " + name + " " + description + " " + price + " " + category + " " + quantity);
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE products SET name = ?, description = ?, price = ?, category_id = ?, quantity = ? WHERE id = ?");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, price);
            preparedStatement.setInt(4, category);
            preparedStatement.setString(5, quantity);
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("getallcategory");
    }
}
