package com.example.ecommercewebapp.Controller.Login;

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

@WebServlet(name = "RegistrationServlet", value = "/registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = "customer";

        System.out.println(name + "+" + email + "+" + password + "+" + confirmPassword + "+" + role);

        if (password != null && !password.isEmpty() && password.equals(confirmPassword)) {
            try {
                Connection connection = ds.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)");
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, password);
                preparedStatement.setString(4, role);
                preparedStatement.executeUpdate();
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            resp.sendRedirect("LoginForm.jsp");
        } else {
            resp.sendRedirect("registration.jsp?error=passwordMismatch");
        }
    }
}