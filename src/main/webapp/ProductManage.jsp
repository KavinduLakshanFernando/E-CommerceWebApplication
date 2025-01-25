<%@ page import="com.example.ecommercewebapp.DTO.CategoryDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommercewebapp.DTO.ProductDto" %><%--
  Created by IntelliJ IDEA.
  User: kavin
  Date: 1/24/2025
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    >
    <style>
        .navbar {
            background-color: #f8f9fa;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #0048ba;
        }

        .nav-link {
            font-size: 16px;
            color: #333 !important;
            margin-right: 15px;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #0048ba !important;
        }
        #dashboard{
            margin-left: -220px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <!-- Brand -->
        <a class="navbar-brand" href="#">LaptopWorld</a>

        <!-- Toggler (for mobile screens) -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Content -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Navigation Links -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user-manage">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category-manage">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <h1 class="mb-4">Product Management</h1>

    <!-- Add Product Button -->
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productModal">
        Add Product
    </button>

    <!-- Product Table -->
<%--    <table class="table table-bordered table-striped mt-4">--%>
<%--        <thead class="table-dark">--%>
<%--        <tr>--%>
<%--            <th>#</th>--%>
<%--            <th>Product Name</th>--%>
<%--            <th>Category</th>--%>
<%--            <th>Description</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Quantity</th>--%>
<%--            <th>Image</th>--%>
<%--            <th>Actions</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody id="productTableBody">--%>
<%--        <!-- Dynamic product rows will be added here -->--%>
<%--        </tbody>--%>
<%--    </table>--%>
    <table class="table table-bordered table-striped mt-4">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="productTableBody">
        <%
            // Retrieve the list of products from the request
            List<ProductDto> products = (List<ProductDto>) request.getAttribute("products");

            if (products != null && !products.isEmpty()) {
                for (ProductDto product : products) {
        %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getCategoryid()%></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getQuantity() %></td>
            <td>
                <img src="<%= request.getContextPath() %>/uploads/<%= product.getImage() %>"
                     alt="Product Image"
                     width="100">
            </td>
            <td>
                <!-- Delete Button -->
                <button class="btn btn-sm btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteProductModal"
                        data-productid="<%= product.getId() %>"
                        data-productname="<%= product.getName() %>"
                        data-productdescription="<%= product.getDescription() %>"
                        data-productprice="<%= product.getPrice() %>"
                        data-productquantity="<%= product.getQuantity() %>"
                        data-productimage="<%= product.getImage() %>">
                    Delete
                </button>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="8" class="text-center">No products found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

</div>

<!-- Product Modal (Add Product) -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="productModalLabel">Add Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="productForm" action="product" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <h1>ddd</h1>
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" name="name" id="productName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select name="categoryId" class="form-select" id="productCategory" required>
                            <%
                                List<CategoryDto> categorie = (List<CategoryDto>) request.getAttribute("categories");
                                if (categorie != null && !categorie.isEmpty()) {
                                    for (CategoryDto category : categorie) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName()%></option>

                            <%
                                    }
                                }
                            %>
                            <!-- Add more categories dynamically -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea id="productDescription" name="description" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" name="price" id="productPrice" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="productQuantity" class="form-label">Quantity</label>
                        <input type="number" name="quantity" id="productQuantity" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" name="image" id="productImage" class="form-control" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Add Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Product Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">Update Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateForm">
                    <div class="mb-3">
                        <label for="updateName" class="form-label">Product Name</label>
                        <input type="text" id="updateName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateCategory" class="form-label">Category</label>
                        <input type="text" id="updateCategory" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateDescription" class="form-label">Description</label>
                        <textarea id="updateDescription" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="updatePrice" class="form-label">Price</label>
                        <input type="number" id="updatePrice" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateQuantity" class="form-label">Quantity</label>
                        <input type="number" id="updateQuantity" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Update Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this product?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript -->
<%--<script>--%>
<%--    let productCounter = 1;--%>
<%--    let currentRow = null;--%>

<%--    const productForm = document.getElementById('productForm');--%>
<%--    const updateForm = document.getElementById('updateForm');--%>
<%--    const productTableBody = document.getElementById('productTableBody');--%>
<%--    const confirmDeleteButton = document.getElementById('confirmDelete');--%>

<%--    productForm.addEventListener('submit', function (e) {--%>
<%--        e.preventDefault();--%>

<%--        const productName = document.getElementById('productName').value;--%>
<%--        const productCategory = document.getElementById('productCategory').value;--%>
<%--        const productDescription = document.getElementById('productDescription').value;--%>
<%--        const productPrice = document.getElementById('productPrice').value;--%>
<%--        const productQuantity = document.getElementById('productQuantity').value;--%>
<%--        const productImage = document.getElementById('productImage').files[0];--%>

<%--        if (productImage) {--%>
<%--            const reader = new FileReader();--%>
<%--            reader.onload = function () {--%>
<%--                addProduct(productName, productCategory, productDescription, productPrice, productQuantity, reader.result);--%>
<%--                productForm.reset();--%>
<%--                const modal = bootstrap.Modal.getInstance(document.getElementById('productModal'));--%>
<%--                modal.hide();--%>
<%--            };--%>
<%--            reader.readAsDataURL(productImage);--%>
<%--        }--%>
<%--    });--%>

<%--    function addProduct(name, category, description, price, quantity, imageSrc) {--%>
<%--        const row = document.createElement('tr');--%>
<%--        row.innerHTML = `--%>
<%--        <td>${productCounter}</td>--%>
<%--        <td>${name}</td>--%>
<%--        <td>${category}</td>--%>
<%--        <td>${description}</td>--%>
<%--        <td>${price}</td>--%>
<%--        <td>${quantity}</td>--%>
<%--        <td><img src="${imageSrc}" alt="${name}" class="img-thumbnail" style="width: 100px;"></td>--%>
<%--        <td>--%>
<%--          <button class="btn btn-sm btn-warning me-2" onclick="openUpdateModal(this)">Edit</button>--%>
<%--          <button class="btn btn-sm btn-danger" onclick="openDeleteModal(this)">Delete</button>--%>
<%--        </td>--%>
<%--      `;--%>
<%--        productTableBody.appendChild(row);--%>
<%--    }--%>

<%--    function openUpdateModal(button) {--%>
<%--        currentRow = button.parentElement.parentElement;--%>
<%--        const cells = currentRow.querySelectorAll('td');--%>

<%--        document.getElementById('updateName').value = cells[1].innerText;--%>
<%--        document.getElementById('updateCategory').value = cells[2].innerText;--%>
<%--        document.getElementById('updateDescription').value = cells[3].innerText;--%>
<%--        document.getElementById('updatePrice').value = cells[4].innerText;--%>
<%--        document.getElementById('updateQuantity').value = cells[5].innerText;--%>

<%--        const modal = new bootstrap.Modal(document.getElementById('updateModal'));--%>
<%--        modal.show();--%>
<%--    }--%>

<%--    updateForm.addEventListener('submit', function (e) {--%>
<%--        e.preventDefault();--%>

<%--        const name = document.getElementById('updateName').value;--%>
<%--        const category = document.getElementById('updateCategory').value;--%>
<%--        const description = document.getElementById('updateDescription').value;--%>
<%--        const price = document.getElementById('updatePrice').value;--%>
<%--        const quantity = document.getElementById('updateQuantity').value;--%>

<%--        const cells = currentRow.querySelectorAll('td');--%>
<%--        cells[1].innerText = name;--%>
<%--        cells[2].innerText = category;--%>
<%--        cells[3].innerText = description;--%>
<%--        cells[4].innerText = price;--%>
<%--        cells[5].innerText = quantity;--%>

<%--        const modal = bootstrap.Modal.getInstance(document.getElementById('updateModal'));--%>
<%--        modal.hide();--%>
<%--    });--%>

<%--    function openDeleteModal(button) {--%>
<%--        currentRow = button.parentElement.parentElement;--%>
<%--        const modal = new bootstrap.Modal(document.getElementById('deleteModal'));--%>
<%--        modal.show();--%>
<%--    }--%>

<%--    confirmDeleteButton.addEventListener('click', function () {--%>
<%--        currentRow.remove();--%>
<%--        const modal = bootstrap.Modal.getInstance(document.getElementById('deleteModal'));--%>
<%--        modal.hide();--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
