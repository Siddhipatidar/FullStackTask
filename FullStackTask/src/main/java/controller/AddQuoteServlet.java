package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Quote;
import dao.QuoteDAO;

@WebServlet("/AddQuoteServlet")
public class AddQuoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        Quote quote = new Quote();
        boolean saved = QuoteDAO.saveQuote(quote);

        if (saved) {
            response.sendRedirect("thank_you.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
