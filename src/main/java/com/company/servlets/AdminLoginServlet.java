package com.company.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Replace with your actual username and password verification logic
        if ("rushi".equals(username) && "rushi@2004".equals(password)) {
            // Redirect to the employee management page or dashboard after successful login
            response.sendRedirect(request.getContextPath() + "/employees");
        } else {
            // Redirect back to the index page with an error message (you can customize this)
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
