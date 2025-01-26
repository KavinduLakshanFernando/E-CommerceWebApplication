package com.example.ecommercewebapp.Controller.CustomerView;

import com.example.ecommercewebapp.DTO.ProductDto;
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

@WebServlet(name = "GetOneProductServlet", value = "/getOneProduct")
public class GetOneProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("clicked doget");
        int id = Integer.parseInt(req.getParameter("productId"));

        System.out.println(id);
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products WHERE id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProductDto product = new ProductDto();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setCategoryid(resultSet.getInt("category_id"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(Double.parseDouble(resultSet.getString("price")));
                product.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                product.setImage(resultSet.getString("image_url"));
                req.setAttribute("product", product);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("PlaceOrder.jsp").forward(req, resp);
    }
}
