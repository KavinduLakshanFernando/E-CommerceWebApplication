<%--
  Created by IntelliJ IDEA.
  User: kavin
  Date: 1/26/2025
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Popup Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Profile Page</h2>
    <!-- Button to Open Modal -->
    <button class="btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#profileModal">
        View / Edit Profile
    </button>
</div>

<!-- Profile Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">My Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <form id="profileForm" action="update-user" method="post">
                    <!-- ID (Read-only) -->
                    <div class="mb-3">
                        <label for="userId" class="form-label">ID</label>
                        <input type="text" name="id" id="userId" class="form-control" value="12345" readonly>
                    </div>

                    <!-- Name -->
                    <div class="mb-3">
                        <label for="userName" class="form-label">Name</label>
                        <input type="text" name="name" id="userName" class="form-control" value="John Doe" required>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="userEmail" class="form-label">Email</label>
                        <input type="email" name="email" id="userEmail" class="form-control" value="john.doe@example.com" required>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="userPassword" class="form-label">Old Password</label>
                        <input type="password" name="oldPasword" id="userPassword" class="form-control" value="password123" required>
                    </div>
                    <div class="mb-3">
                        <label for="userPassword2" class="form-label">New Password</label>
                        <input type="password" name="newPassword" id="userPassword2" class="form-control" value="password123" required>
                    </div>
                    <div class="mb-3">
                        <label for="userPassword3" class="form-label">Comfirm Password</label>
                        <input type="password" name="confirmPassword" id="userPassword3" class="form-control" value="password123" required>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" form="profileForm">Save Changes</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

