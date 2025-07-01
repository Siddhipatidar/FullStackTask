package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

import model.Project;
import dao.ProjectDAO;

@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");

        Project project = new Project();
        project.setName(name);
        project.setDescription(description);
        project.setImageUrl(imageUrl);

        boolean status = ProjectDAO.addProject(project);
        response.sendRedirect("admin/dashboard.jsp?status=" + (status ? "success" : "fail"));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Project> projects = ProjectDAO.getAllProjects(); // from DB
        request.setAttribute("projects", projects);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
}
