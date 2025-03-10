<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.models.Product" %>
<%@ page import="org.example.models.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<% HttpSession sessionObj = request.getSession(false);
    User activeUser = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
    if (activeUser == null) {
        response.sendRedirect("login");
    }
%>

<div class="d-flex">
    <!-- Sidebar -->
    <div class="bg-dark text-white p-3" style="width: 250px; height: 100vh;">
        <h4 class="text-center">Dashboard</h4>
        <ul class="nav flex-column">
            <li class="nav-item"><a href="#" class="nav-link text-white">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link text-white">Products</a></li>
            <li class="nav-item"><a href="#" class="nav-link text-white">Settings</a></li>
        </ul>
        <hr>
        <a href="logout" class="btn btn-danger w-100">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="container mt-4 flex-grow-1">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Product List</h2>
            <p class="text-muted">Welcome, <%= activeUser != null ? activeUser.getUsername() : "Guest" %>!</p>
        </div>

        <!-- Add Product Form -->
        <form action="products" method="post" class="mb-4">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <input type="text" name="name" class="form-control" placeholder="Product Name" required>
            </div>
            <div class="mb-3">
                <input type="text" name="description" class="form-control" placeholder="Description" required>
            </div>
            <div class="mb-3">
                <input type="number" step="0.01" name="price" class="form-control" placeholder="Price" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) { %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getDescription() %></td>
                <td>$<%= product.getPrice() %></td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editProduct(<%= product.getId() %>, '<%= product.getName() %>', '<%= product.getDescription() %>', <%= product.getPrice() %>)">Edit</button>
                    <a href="products?action=delete&id=<%= product.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Edit Product Modal -->
<div id="editModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="products" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" id="editId">
                    <div class="mb-3">
                        <input type="text" name="name" id="editName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" name="description" id="editDescription" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <input type="number" step="0.01" name="price" id="editPrice" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-success">Update Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function editProduct(id, name, description, price) {
        document.getElementById("editId").value = id;
        document.getElementById("editName").value = name;
        document.getElementById("editDescription").value = description;
        document.getElementById("editPrice").value = price;
        new bootstrap.Modal(document.getElementById("editModal")).show();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
