
package com.example.ecommercewebapp.Controller.User;

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

@WebServlet(name = "UpdateUserServlet", value = "/update-user")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (password != null && !password.isEmpty() && password.equals(confirmPassword)) {
            try {
                Connection connection = ds.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("update user set name = ?, email = ?, password = ? where id = ?");
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, password);
                preparedStatement.setInt(4, id);
                preparedStatement.executeUpdate();
                connection.close();
                resp.sendRedirect("index.jsp");
        } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
}}
