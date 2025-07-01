<%@ page import="dao.ContactFormDAO, model.ContactForm, dao.SubscriberDAO, model.Subscriber, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f8f9fa;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: #333;
        }

        section {
            background: #fff;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        form input, form textarea {
            width: 100%;
            margin: 8px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button {
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        form button:hover {
            background-color: #0056b3;
        }

        .contact-entry, .subscriber-entry {
            background-color: #f1f1f1;
            padding: 10px 15px;
            margin-bottom: 10px;
            border-radius: 6px;
        }

        .contact-entry p, .subscriber-entry p {
            margin: 4px 0;
        }
    </style>
</head>
<body>

<h1>Admin Panel</h1>

<!-- Add Project Section -->
<section>
    <h2>Add Project</h2>
    <form action="../AddProjectServlet" method="post">
        <input type="text" name="name" placeholder="Project Name" required />
        <textarea name="description" placeholder="Project Description" required></textarea>
        <input type="text" name="imageUrl" placeholder="Image URL" />
        <button type="submit">Add Project</button>
    </form>
</section>

<!-- Add Client Section -->
<section>
    <h2>Add Client</h2>
    <form action="../AddClientServlet" method="post">
        <input type="text" name="name" placeholder="Client Name" required />
        <textarea name="description" placeholder="Client Description" required></textarea>
        <input type="text" name="designation" placeholder="Designation" required />
        <input type="text" name="imageUrl" placeholder="Client Image URL" />
        <button type="submit">Add Client</button>
    </form>
</section>

<!-- Contact Form Submissions -->
<section>
    <h2>Contact Form Submissions</h2>
    <%
        List<ContactForm> contacts = ContactFormDAO.getAllForms();
        if (contacts.isEmpty()) {
    %>
        <p>No contact form submissions found.</p>
    <%
        } else {
            for (ContactForm cf : contacts) {
    %>
        <div class="contact-entry">
            <p><b>Name:</b> <%= cf.getFullName() %></p>
            <p><b>Email:</b> <%= cf.getEmail() %></p>
            <p><b>Mobile:</b> <%= cf.getMobile() %></p>
            <p><b>City:</b> <%= cf.getCity() %></p>
        </div>
    <%      }
        }
    %>
</section>

<!-- Newsletter Subscribers -->
<section>
    <h2>Newsletter Subscribers</h2>
    <%
        List<Subscriber> subs = SubscriberDAO.getAllSubscribers();
        if (subs.isEmpty()) {
    %>
        <p>No subscribers found.</p>
    <%
        } else {
            for (Subscriber s : subs) {
    %>
        <div class="subscriber-entry">
            <p><%= s.getEmail() %></p>
        </div>
    <%      }
        }
    %>
</section>

</body>
</html>
