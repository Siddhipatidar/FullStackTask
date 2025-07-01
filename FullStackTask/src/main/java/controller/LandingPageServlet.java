package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import dao.ProjectDAO;
import dao.ClientDAO;
import model.Project;
import model.Client;

@WebServlet("/landing")
public class LandingPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from DB
        List<Project> projectList = new ProjectDAO().getAllProjects();
        List<Client> clientList = new ClientDAO().getAllClients();

        // Set in request
        request.setAttribute("projects", projectList);
        request.setAttribute("clients", clientList);

        // Forward to landing/home.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("landing/home.jsp");
        dispatcher.forward(request, response);
    }
}
