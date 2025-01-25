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
                    <a class="nav-link" href="getallcategory">Category</a>
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
                <!-- Update Button -->
                <button class="btn btn-sm btn-warning"
                        data-bs-toggle="modal"
                        data-bs-target="#updateModal"
                        data-productid="<%= product.getId() %>"
                        data-productname="<%= product.getName() %>"
                        data-productcategory="<%= product.getCategoryid() %>"
                        data-productdescription="<%= product.getDescription() %>"
                        data-productprice="<%= product.getPrice() %>"
                        data-productquantity="<%= product.getQuantity() %>"
                        data-productimage="<%= product.getImage() %>">
                    Update
                </button>

                <!-- Delete Button -->
                <button class="btn btn-sm btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteModal"
                        data-productid="<%= product.getId() %>"
                        data-productname="<%= product.getName() %>">
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

<!-- Update Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">Update Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateForm" action="product-update" method="post">
                    <input type="hidden" id="updateProductId" name="productId">
                    <div class="mb-3">
                        <label for="updateName" class="form-label">Product Name</label>
                        <input type="text" id="updateName" name="productName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateCategory" class="form-label">Category</label>
                        <select name="categoryId" class="form-select" id="updateCategory" required>
                            <%
                                List<CategoryDto> categories = (List<CategoryDto>) request.getAttribute("categories");
                                if (categories != null && !categories.isEmpty()) {
                                    for (CategoryDto category : categories) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName()%></option>

                            <%
                                    }
                                }
                            %>
                            <!-- Add more categories dynamically -->
                        </select>                    </div>
                    <div class="mb-3">
                        <label for="updateDescription" class="form-label">Description</label>
                        <textarea id="updateDescription" name="productDescription" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="updatePrice" class="form-label">Price</label>
                        <input type="number" id="updatePrice" name="productPrice" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateQuantity" class="form-label">Quantity</label>
                        <input type="number" id="updateQuantity" name="productQuantity" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Update Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="deleteMessage">Are you sure you want to delete this product?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <form id="deleteForm" action="product-delete" method="post">
                    <input type="hidden" id="deleteProductId" name="productId">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript -->
<script>
    // Handle Update Modal Data
    const updateModal = document.getElementById('updateModal');
    updateModal.addEventListener('show.bs.modal', (event) => {
        const button = event.relatedTarget; // Button that triggered the modal
        const productId = button.getAttribute('data-productid');
        const productName = button.getAttribute('data-productname');
        const productCategory = button.getAttribute('data-productcategory');
        const productDescription = button.getAttribute('data-productdescription');
        const productPrice = button.getAttribute('data-productprice');
        const productQuantity = button.getAttribute('data-productquantity');

        // Populate the form fields with the data
        document.getElementById('updateProductId').value = productId;
        document.getElementById('updateName').value = productName;
        document.getElementById('updateCategory').value = productCategory;
        document.getElementById('updateDescription').value = productDescription;
        document.getElementById('updatePrice').value = productPrice;
        document.getElementById('updateQuantity').value = productQuantity;
    });

    // Handle Delete Modal Data
    const deleteModal = document.getElementById('deleteModal');
    deleteModal.addEventListener('show.bs.modal', (event) => {
        const button = event.relatedTarget; // Button that triggered the modal
        const productId = button.getAttribute('data-productid');
        const productName = button.getAttribute('data-productname');

        // Populate the hidden input field and display the product name
        document.getElementById('deleteProductId').value = productId;
        document.getElementById('deleteMessage').textContent = `Are you sure you want to delete the product "${productName}"?`;
    });
</script>

</body>
</html>
