package com.example.ecommercewebapp.Controller.Product;

import com.example.ecommercewebapp.DTO.CategoryDto;
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

@WebServlet(name = "GetAllCategoryServlet", value = "/getallcategory")
public class GetAllCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDto> categories = new ArrayList<>();

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        try{
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM categories");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                CategoryDto category = new CategoryDto();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("categories", categories);
        req.getRequestDispatcher("product").forward(req, resp);
    }

}
