package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import model.Subscriber;
import dao.SubscriberDAO;

@WebServlet("/SubscribeServlet")
public class SubscribeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        Subscriber s = new Subscriber();
        s.setEmail(email);

        boolean status = SubscriberDAO.addSubscriber(s);
        response.sendRedirect("landing/home.jsp?subscribeStatus=" + (status ? "success" : "fail"));
    }
}