<%@ page import="com.example.ecommercewebapp.DTO.CategoryDto" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: kavin
  Date: 1/21/2025
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laptop Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
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
                    <a class="nav-link" href="getallcategory">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="getAllOrders">View Orders</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Laptop Categories</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">Add Category</button>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Category Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="categoryTableBody">
        <%
            List<CategoryDto> categories = (List<CategoryDto>) request.getAttribute("categories");
            if (categories != null) {
                for (CategoryDto category : categories) {
        %>
        <tr>
            <td><%= category.getId() %></td>
            <td><%= category.getName() %></td>
            <td><%= category.getDescription() %></td>
            <td>
                <!-- Edit Button -->
                <button class="btn btn-sm btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#editCategoryModal"
                        data-categoryid="<%= category.getId() %>"
                        data-categoryname="<%= category.getName() %>"
                        data-categorydescription="<%= category.getDescription() %>">
                    <Edit>Edit</Edit>
                </button>

                <!-- Delete Button -->
                <button class="btn btn-sm btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteCategoryModal"
                        data-categoryid="<%= category.getId() %>"
                        data-categoryname="<%= category.getName() %>">
                    <Delete>Delete</Delete>
                </button>
            </td>
            <%
                }
                }

                %>
        <!-- Dynamically populated rows will go here -->
        </tbody>
    </table>
</div>

<!-- Add Category Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add Laptop Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addCategoryForm" action="category-manage" method="post">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" name="name" id="categoryName" placeholder="Enter category name" required>
                    </div>
                    <div class="mb-3">
                        <label for="categoryDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="categoryDescription" rows="3" placeholder="Enter description" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Category</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Edit Category Modal -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryModalLabel">Edit Laptop Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editCategoryForm" action="updateCategory" method="post">
                    <input type="hidden" name="id" id="editCategoryId">
                    <div class="mb-3">
                        <label for="editCategoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" name="name" id="editCategoryName" placeholder="Enter category name" required>
                    </div>
                    <div class="mb-3">
                        <label for="editCategoryDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="editCategoryDescription" rows="3" placeholder="Enter description" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Category Modal -->
<div class="modal fade" id="deleteCategoryModal" tabindex="-1" aria-labelledby="deleteCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteCategoryModalLabel">Delete Laptop Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="deleteCategoryForm" action="deleteCategory" method="post">
                    <input type="hidden" name="id" id="deleteCategoryId">
                    <p>Are you sure you want to delete the category: <strong id="deleteCategoryName"></strong>?</p>
                    <button type="submit" class="btn btn-danger">Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    // Populate the Edit Category Modal with data
    $('#editCategoryModal').on('show.bs.modal', function (event) {
        const button = $(event.relatedTarget); // Button that triggered the modal
        const categoryId = button.data('categoryid'); // Get category ID
        const categoryName = button.data('categoryname'); // Get category name
        const categoryDescription = button.data('categorydescription'); // Get category description

        // Populate the modal fields
        $('#editCategoryId').val(categoryId);
        $('#editCategoryName').val(categoryName);
        $('#editCategoryDescription').val(categoryDescription);
    });

    // Populate the Delete Category Modal with data
    $('#deleteCategoryModal').on('show.bs.modal', function (event) {
        const button = $(event.relatedTarget); // Button that triggered the modal
        const categoryId = button.data('categoryid'); // Get category ID
        const categoryName = button.data('categoryname'); // Get category name

        // Populate the modal fields
        $('#deleteCategoryId').val(categoryId); // Set hidden input value
        $('#deleteCategoryName').text(categoryName); // Update confirmation text
    });
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>