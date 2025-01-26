<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommercewebapp.DTO.ProductDto" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>JSP - Hello World</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1><%= "Hello World!" %></h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<%--</body>--%>
<%--</html>--%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <!-- Bootstrap CSS -->
  <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@400;700&display=swap" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
  <style>
    /* Custom CSS for Navbar */
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

    .search-bar {
      position: relative;
    }

    .search-bar input {
      border-radius: 30px;
      border: 1px solid #ddd;
      padding: 8px 20px;
      padding-right: 45px;
      width: 100%;
    }

    .search-bar button {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      background: none;
      border: none;
      color: #0048ba;
      font-size: 18px;
      cursor: pointer;
    }

    .user-icons i {
      font-size: 20px;
      color: #333;
      margin-right: 20px;
      transition: color 0.3s ease;
      cursor: pointer;
    }

    .user-icons i:hover {
      color: #0048ba;
    }

    .user-icons .badge{
      position: absolute;
      top: -5px;
      right: -10px;
      background-color: red;
      color: white;
      font-size: 12px;
      border-radius: 50%;
    }
    p{
      margin-top: 15px;
    }
    #cart_section {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      gap: 25px;
    }
    .product-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 8px;
      background-color: #fff;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      width: 13rem; /* Adjust width */
    }
    .product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .product-card img {
      object-fit: contain;
      width: 100%;
      height: 100px;
      border-radius: 8px;
    }
    .product-title {
      font-size: 1rem;
      font-weight: bold;
      color: #007bff;
    }
    .product-price {
      color: #28a745;
      font-weight: bold;
    }
    .btn-add-to-cart {
      background-color: #007bff;
      color: #fff;
      border: none;
    }
    .btn-add-to-cart:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<!-- Navbar -->
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
          <a class="nav-link active" href="AdminDashBoard.jsp">Admin Home</a>
        </li>
        <li class="nav-item">
          <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Categories
                </a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <li>
                    <a class="dropdown-item" href="#">
                      <span class="dropdown-item-icon">💻</span>
                      Laptops
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">
                      <span class="dropdown-item-icon">🖥️</span>
                      Desktops
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">
                      <span class="dropdown-item-icon">🎮</span>
                      Gaming PCs
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">
                      <span class="dropdown-item-icon">🔧</span>
                      Accessories
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">
                      <span class="dropdown-item-icon">⚙️</span>
                      Custom Builds
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <div class="collapse navbar-collapse" id="navbarNavDropdown2">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Brands
                </a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <li>
                    <a class="dropdown-item" href="#">Hp</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Dell</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Acer</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Msi</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Asus</a>
                  </li>

                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
              </li>
            </ul>
          </div>
        </li>
      </ul>

      <!-- Search Bar -->
      <div class="search-bar me-3">
        <input type="text" class="form-control" placeholder="Search laptops, accessories...">
        <button><i class="bi bi-search"></i></button>
      </div>

      <!-- User Options -->
      <div class="user-icons d-flex align-items-center">
        <!-- Notifications -->
        <div class="position-relative">
          <i class="bi bi-bell"></i>
          <span class="badge">3</span>
        </div>
        <!-- Cart -->
        <div class="position-relative">
          <i class="bi bi-cart"></i>
        </div>
        <!-- User Profile -->
        <!--                <a href="#" class="nav-link">Login</a>-->
     <%--   <p>Hello,
          <a href="LoginForm.jsp" id="loginLink" data-dialog="login" data-step="1">Sign In</a> or <a href="SignUpForm.jsp" id="registerLink" data-dialog="login" data-step="2">Sign Up</a>
        </p>--%>

        <div class="d-flex align-items-center">
          <a href="getMyData?userId=<%= session.getAttribute("userId") %>" id="profileLink" class="nav-link" style="display: none;"><i class="bi bi-person"></i></a>
          <a href="LoginForm.jsp" id="loginLink" class="nav-link" style="display: block;">
            <i class="bi bi-box-arrow-in-right"></i>
          </a>

        </div>
      </div>
    </div>
  </div>
</nav>

<%
  String userId = (String) session.getAttribute("userId");
  System.out.println(userId + " :User ID");
  boolean isLoggedIn = (userId != null);
  if (userId != null) {
    System.out.println("logged in");
%>
<script>
  window.addEventListener('DOMContentLoaded', function () {
    var loginLink = document.getElementById("loginLink");
    var profileLink = document.getElementById("profileLink");

    if (loginLink && profileLink) {
      loginLink.style.display = "none";
      profileLink.style.display = "block";
    }
  });
</script>
<%
} else {
  System.out.println("not logged in");
%>
<script>
  window.addEventListener('DOMContentLoaded', function () {
    var loginLink = document.getElementById("loginLink");
    var profileLink = document.getElementById("profileLink");

    if (loginLink && profileLink) {
      loginLink.style.display = "block";
      profileLink.style.display = "none";
    }
  });
</script>
<%
  }
%>
<!--//slider-->
<div id="sliderCarousel" class="carousel slide" data-bs-ride="carousel">
  <!-- Indicators -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#sliderCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#sliderCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#sliderCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>

  <!-- Slides -->
  <div class="carousel-inner">
    <!-- Slide 1 -->
    <div class="carousel-item active">
      <img src="assets/Homepage/1300x300%20Green-01.jpg" class="d-block w-100" alt="Nature Image">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <!-- Slide 2 -->
    <div class="carousel-item">
      <img src="assets/Homepage/file.jpg" class="d-block w-100" alt="City Image">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <!-- Slide 3 -->
    <div class="carousel-item">
      <img src="assets/Homepage/file%202.png" class="d-block w-100" alt="Forest Image">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
  </div>

  <!-- Controls -->
  <button class="carousel-control-prev" type="button" data-bs-target="#sliderCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#sliderCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>



<div id="cart_section" class="container py-4">

  <%
    List<ProductDto> products = (List<ProductDto>) request.getAttribute("products");

    if (products != null && !products.isEmpty()) {
      System.out.println("product Is Not NUll");
      for (ProductDto product : products) {
        System.out.println(product.getName()+" : index.jsp");


  %>

  <div class="product-card">
    <img src="<%= request.getContextPath() %>/uploads/<%= product.getImage() %>" alt="Product Image" class="card-img-top" style="border-radius: 15px; height: 180px; object-fit: cover; margin-bottom: 15px;">
    <p class="text-muted mt-3 mb-1"><%=product.getName()%></p>
    <p class="text-success mb-2"><%=product.getQuantity()%></p>
    <p class="text-success mb-2"><%=product.getDescription()%></p>
    <h6 class="product-title">Acer LED Vertica</h6>
    <div class="d-flex align-items-center mb-2">
      <span class="product-price">Rs. <%=product.getPrice()%></span>
    </div>
    <form class="productForm" style="display: none;" method="get" action="getOneProduct">
      <input type="hidden" name="productId" value="<%= product.getId() %>">
    </form>
    <div class="d-flex justify-content-between align-items-center">
      <button class="btn btn-add-to-cart" onclick="submitForm(this)">ADD TO CART</button>
    </div>
  </div>




  <%
      }
    }else {
      System.out.println("product Is NUll");
    }
  %>
</div>
<script src="jq/jquery-3.7.1.min.js"></script>
<script>
  function submitForm(button) {
    console.log("clicked");
    const form = button.closest('.d-flex').previousElementSibling;
    if (form && form.classList.contains('productForm')) {
      form.submit();
    }
  }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>