package com.example.ecommercewebapp.Controller.Product;

import com.example.ecommercewebapp.DTO.ProductDto;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "ProductManageServlet", value = "/product")
public class ProductManageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("dopost");
        String name = req.getParameter("name");
        int categoryid = Integer.parseInt(req.getParameter("categoryId"));
        String description = req.getParameter("description");
        String price = req.getParameter("price");
        String quantity = req.getParameter("quantity");

        Part filePart = req.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }


        filePart.write(uploadPath + File.separator + fileName);

        System.out.println(name + " " + categoryid + " " + description + " " + price + " " + quantity + " " + fileName);

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO products (name,category_id , description, price, quantity, image_url) VALUES (?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, String.valueOf(categoryid));
            preparedStatement.setString(3, description);
            preparedStatement.setString(4, price);
            preparedStatement.setString(5, quantity);
            preparedStatement.setString(6, fileName);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        resp.sendRedirect("product");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDto> products = new ArrayList<>();

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products");
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
                products.add(product);
            }
            connection.close();
            req.setAttribute("products", products);
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
