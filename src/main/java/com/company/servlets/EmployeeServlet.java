package com.company.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.Employee;

@SuppressWarnings("serial")
public class EmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("EmployeeServlet doGet called.");
       
        try (Connection conn = DatabaseConnection.getConnection()) {
            System.out.println("Database connection established."); // Print connection success
            
            List<Employee> employees = new ArrayList<>();
            
            String sql = "SELECT e.id, e.name, e.email, e.phone, e.role, e.salary, e.department_id, d.name AS department_name " +
                    "FROM Employee e LEFT JOIN Department d ON e.department_id = d.id";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            System.out.println("SQL Query executed: " + sql); // Print SQL statement

            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("role"),
                        rs.getDouble("salary"),
                        rs.getInt("department_id"),
                		rs.getString("department_name"));
                employees.add(employee);
            }

            System.out.println("Number of employees retrieved: " + employees.size()); // Print number of employees

            request.setAttribute("employees", employees);
            request.getRequestDispatcher("/employees.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace(); // Print any SQL exceptions
            // Handle database errors and optionally redirect to an error page
        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        double salary = Double.parseDouble(request.getParameter("salary"));
        int departmentId = Integer.parseInt(request.getParameter("department_id"));

        try (Connection conn = DatabaseConnection.getConnection()) {
        	
        	
                // Adding a new employee
                String sql = "INSERT INTO Employee (name, email, phone, department_id, role, salary) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setInt(4, departmentId);
                stmt.setString(5, role);
                stmt.setDouble(6, salary);
           

            int rowsInserted = stmt.executeUpdate();
            System.out.println("Rows inserted: " + rowsInserted); // Print the result of the insert operation

            // Redirect to the employee list page
            response.sendRedirect(request.getContextPath() + "/employees");

        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL exceptions
            // Optionally, forward to an error page with error messages
            request.setAttribute("error", "Failed to add employee: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
