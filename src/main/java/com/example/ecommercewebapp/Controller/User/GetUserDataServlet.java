package com.example.ecommercewebapp.Controller.User;

import com.example.ecommercewebapp.DTO.UserDto;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.net.http.HttpClient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "GetUserDataServlet", value = "/getMyData")
public class GetUserDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("userId");
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where id = ?");
            preparedStatement.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = preparedStatement.executeQuery();
            UserDto userDto = new UserDto();
            while (resultSet.next()) {
                userDto.setId(resultSet.getInt(1));
                userDto.setName(resultSet.getString(2));
                userDto.setEmail(resultSet.getString(3));
                userDto.setPassword(resultSet.getString(4));
            }
            connection.close();
            req.setAttribute("user", userDto);
            req.getRequestDispatcher("MyProfile.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String newpassword = req.getParameter("newPassword");
        String confirmpassword = req.getParameter("confirmPassword");


        System.out.println(id + " hhhh");

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("update users set name = ?, email = ?, password = ? where id = ?");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, newpassword);
            preparedStatement.setInt(4, Integer.parseInt(id));
            preparedStatement.executeUpdate();
            connection.close();
            resp.sendRedirect("index.jsp");
        } catch (SQLException e) {
            resp.sendRedirect("index.jsp");
            throw new RuntimeException(e);
        }




    }

}
