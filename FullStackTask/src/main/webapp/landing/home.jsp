<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Project, dao.ProjectDAO, model.Client, dao.ClientDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Landing Page</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
<script src="<%= request.getContextPath() %>/assets/js/script.js"></script>

</head>
<body>
<!-- HEADER SECTION -->
<header class="main-header">
    <img src="<%= request.getContextPath() %>/assets/images/logo.svg" alt="Real Trust Logo" />

    <nav class="nav-menu">
        <a href="#">Home</a>
        <a href="#services">Services</a>
        <a href="#about">About</a>
        <a href="#project-section">Projects</a>
        <a href="#">Testimonials</a>
       <a href="#" onclick="showContactForm()" class="contact-btn">CONTACT</a>

    </nav>

</header>
<section class="hero">
  <div class="hero-content">
    
    <!-- LEFT: Headline Text -->
    <div class="hero-left">
      <h1>Consultation,<br>Design,<br>& Marketing</h1>
    </div>

    <!-- RIGHT: Contact Form -->
    <div class="hero-right">
      <div id="contact-form-wrapper" class="contact-form-wrapper hidden">
        <h2>Get a Free<br>Consultation</h2>
        <form action="<%= request.getContextPath() %>/ContactFormServlet" method="post" class="contact-form">
            <input type="text" name="fullName" placeholder="Full Name" required />
            <input type="email" name="email" placeholder="Enter Email Address" required />
            <input type="text" name="mobile" placeholder="Mobile Number" required />
            <input type="text" name="city" placeholder="Area, City" required />
            <button type="submit">Get Quick Quote</button>
        </form>
      </div>
    </div>

  </div>
</section>

<section>
 <div class="hero-section">
    <div class="left">
      <h1><span class="highlight">Not Your Average</span> Realtor</h1>
      <p>We’re not here to simply sell properties. We craft award-winning designs and effective marketing to get homes seen and sold with ease.</p>
    </div>

    <div class="right">
      <div class="circle main">
               <img src="<%= request.getContextPath() %>/assets/images/Ellipse 11.svg" alt="Realtor Main">
      </div>
      <div class="circle top-right">
        <img src="<%= request.getContextPath() %>/assets/images/Ellipse 13.svg" alt="Happy Couple">
      </div>
      <div class="circle bottom-right">
        <img src="<%= request.getContextPath() %>/assets/images/Ellipse 12.svg" alt="Realtor Holding House">
      </div>
    </div>
  </div>
</section>

<section>

 <section id="services" class="why-choose-us">
        <h2 class="section-title">Why Choose Us?</h2>
        <div class="card-container">
            <div class="card">
                <div class="icon">🏠</div>
                <h3>Potential ROI</h3>
                <p>
                    Whether you are looking to buy a development or renovate your current home for resale, we’ll lead you through proven ROI-driven strategies.
                </p>
            </div>
            <div class="card">
                <div class="icon">🖌️</div>
                <h3>Design</h3>
                <p>
                    Our in-house team ensures design meets the perfect guidelines from your design experience and brand identity, customized for today’s home buyers.
                </p>
            </div>
            <div class="card">
                <div class="icon">💵</div>
                <h3>Marketing</h3>
                <p>
                    Staying on top of trends, networks and digital tools is a sophisticated part of the marketing plan accompanying every listing in today’s market.
                </p>
            </div>
        </div>
        </section>
       
       <section class="image-showcase">
        <div class="image-container">
            <div class="image-box box-left">
               <img src="<%= request.getContextPath() %>/assets/images/pexels-brett-sayles-2881232.svg" alt="Handshake" />
                <span class="corner corner-orange"></span>
            </div>
            <div class="image-box box-center">
        <img src="<%= request.getContextPath() %>/assets/images/pexels-andres-ayrton-6578391.svg" alt="Agent with Client">
                <span class="corner corner-blue"></span>
            </div>
            <div class="image-box box-right">
                <img src="<%= request.getContextPath() %>/assets/images/pexels-fauxels-3182834.svg" alt="Discussion" />
                <span class="corner corner-brown"></span>
            </div>
        </div>
    </section>    

<section id="about" class="about-us">
        <h2 class="section-title">About Us</h2>
        <p class="about-description">
            Fifteen years of experience in real estate, excellent customer service and a commitment to work hard, listen and follow through. We provide quality service to build relationships with clients and, more importantly, maintain those relationships by communicating effectively.
        </p>
        <button class="learn-more-btn" onclick="learnMore()">LEARN MORE</button>
    </section>




</section>

<section id="project-section">
<h2 style="text-align:center; margin-top: 30px;">Our Projects</h2>

<%
    List<Project> projects = ProjectDAO.getAllProjects();
    if (projects == null || projects.isEmpty()) {
%>
    <p style="color:red; text-align:center;">No projects found.</p>
<%
    } else {
%>
    <div class="project-showcase">
<%
        for (Project p : projects) {
%>
        <div class="project-card">
            <img src="<%= request.getContextPath() %>/<%= p.getImageUrl() %>" alt="Project Image">
            <h3><%= p.getName() %></h3>
            <p><%= p.getDescription() %></p>
            <button>READ MORE</button>
        </div>
<%
        }
%>
    </div>
<%
    }
%>
</section>

<hr>
<h2 style="text-align:center; margin-top: 40px;">Happy Clients</h2>

<div class="testimonial-container">
<%
    List<Client> clients = ClientDAO.getAllClients();
    if (clients != null && !clients.isEmpty()) {
        for (Client c : clients) {
%>
    <div class="testimonial-card">
        <img src="<%= request.getContextPath() %>/<%= c.getImageUrl() %>" alt="Client Image" />
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <h4><a href="#"> <%= c.getName() %> </a></h4>
        <small><%= c.getDesignation() %></small>
    </div>
<%
        }
    } else {
%>
    <p style="color: red; text-align: center;">No happy clients found.</p>
<%
    }
%>
</div>



<hr>


<hr>

<div class="newsletter-section">
    <div class="newsletter-container">
        <nav class="nav-links">
            <a href="#">Home</a>
            <a href="#">Services</a>
            <a href="#">Projects</a>
            <a href="#">Testimonials</a>
            <a href="#">Contact</a>
        </nav>

        <div class="subscribe-box">
            <label>Subscribe Us</label>
            <form action="<%= request.getContextPath() %>/SubscribeServlet" method="post">
                <input type="email" name="email" placeholder="Enter Email Address" required />
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>




