
## 📌 Features

- Responsive landing page with dynamic project listing
- Contact form with full name, email, phone, and city
- Admin panel to manage:
  - Projects
  - Client information
  - Contact form submissions
  - Newsletter subscribers
- Newsletter signup form
- MySQL-backed data storage with Java Servlet/JSP backend

- 
## 🛠 Tech Stack

**Frontend:**
- HTML5, CSS3, JavaScript
- Bootstrap 4

**Backend:**
- Java 17
- Servlet + JSP
- JDBC

**Database:**
- MySQL 8.0

**Tools:**
- Eclipse IDE
- Apache Tomcat 10.1
- GitHub for version control


## 🗃️ Database Schema

**Database Name**: `fullstackdb`

### Tables:
1.contact_Form
2.clients
3.projects
4.admin_users
5.newsletter_subscriber


Steps:
1. Clone the repo:
   git clone https://github.com/your-username/your-repo.git
2.Import the project into Eclipse as a Dynamic Web Project or Maven Web App.

3.Create the database fullstackdb and run the SQL table creation scripts provided above.

4.Configure your DB credentials in your DAO or DBConnection.java:

         String url = "jdbc:mysql://localhost:3306/fullstackdb";
         String username = "root";
         String password = "your_password";
5.Deploy the project on Apache Tomcat 10.1 server.

6.Open in browser:
    http://localhost:8080/FullStackTask/landing/home.jsp


