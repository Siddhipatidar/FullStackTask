package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/ContactFormServlet")
public class ContactFormServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String city = request.getParameter("city");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to DB (update with your credentials)
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fullstackdb", "root", "root");

            // SQL Query
            String sql = "INSERT INTO contact_quotes (full_name, email, mobile, city) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, mobile);
            stmt.setString(4, city);

            // Execute
            int rows = stmt.executeUpdate();

            // Redirect or show success message
            response.sendRedirect("thankyou.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
