package controller;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        boolean isValid = AdminDAO.validate(user, pass);
        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", user);
            response.sendRedirect("admin/admin_dashboard.jsp");
        } else {
            response.sendRedirect("admin_login.jsp?error=1");
        }
    }
}
