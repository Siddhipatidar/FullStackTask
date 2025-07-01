package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import model.Client;
import dao.ClientDAO;

@WebServlet("/AddClientServlet")
public class AddClientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String designation = request.getParameter("designation");
        String imageUrl = request.getParameter("imageUrl");

        Client client = new Client();
        client.setName(name);
        client.setDescription(description);
        client.setDesignation(designation);
        client.setImageUrl(imageUrl);

        boolean status = ClientDAO.addClient(client);
        response.sendRedirect("admin/dashboard.jsp?clientStatus=" + (status ? "success" : "fail"));
    }
}