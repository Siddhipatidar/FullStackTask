<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Project, model.Client" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Landing Page</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .client-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
</head>
<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Company</a>
</nav>

<!-- OUR PROJECTS Section -->
<div class="container mt-5">
    <h2 class="text-center">Our Projects</h2>
    <div class="row">
        <%
            List<Project> projects = (List<Project>) request.getAttribute("projects");
            if (projects != null) {
                for (Project p : projects) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="assets/images/Ellipse 11.svg" class="card-img-top" alt="Project Image">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getName() %></h5>
                    <p class="card-text"><%= p.getDescription() %></p>
                    <a href="#" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
        <% }} %>
    </div>
</div>

<!-- HAPPY CLIENTS Section -->
<div class="container mt-5">
    <h2 class="text-center">Happy Clients</h2>
    <div class="row">
        <%
            List<Client> clients = (List<Client>) request.getAttribute("clients");
            if (clients != null) {
                for (Client c : clients) {
        %>
        <div class="col-md-4 text-center mb-4">
           <img src="assets/images/Ellipse 12.svg" alt="Client" class="client-img mb-2">
            <blockquote class="blockquote">
                <p><%= c.getDescription() %></p>
                <footer class="blockquote-footer">
                    <strong><%= c.getName() %></strong>,
                    <cite title="Source Title"><%= c.getDesignation() %></cite>
                </footer>
            </blockquote>
        </div>
        <% }} %>
    </div>
</div>

<!-- CONTACT FORM Section -->
<div class="container mt-5">
    <h2 class="text-center">Contact Us</h2>
    <form action="ContactFormServlet" method="post" class="w-75 mx-auto">
        <div class="form-group">
            <input type="text" name="fullName" class="form-control" placeholder="Full Name" required>
        </div>
        <div class="form-group">
            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
        </div>
        <div class="form-group">
            <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" required>
        </div>
        <div class="form-group">
            <input type="text" name="city" class="form-control" placeholder="City" required>
        </div>
        <button type="submit" class="btn btn-success btn-block">Submit</button>
    </form>
</div>

<!-- NEWSLETTER SUBSCRIPTION Section -->
<div class="container mt-5 mb-5">
    <h2 class="text-center">Subscribe to our Newsletter</h2>
    <form action="NewsletterServlet" method="post" class="form-inline justify-content-center mt-3">
        <input type="email" name="email" class="form-control mr-2" placeholder="Enter your email" required>
        <button type="submit" class="btn btn-primary">Subscribe</button>
    </form>
</div>

<!-- Bootstrap JS CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
