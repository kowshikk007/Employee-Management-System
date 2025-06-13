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

import com.company.Department;
import com.company.Employee;

@SuppressWarnings("serial")
public class EditEmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("id")); // Get the employee ID from the request
        List<Department> departments = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Fetch the employee details
            String sqlEmployee = "SELECT e.id, e.name, e.email, e.phone, e.role, e.salary, e.department_id, d.name AS department_name "
                    + "FROM Employee e LEFT JOIN Department d ON e.department_id = d.id WHERE e.id = ?";
            PreparedStatement stmtEmployee = conn.prepareStatement(sqlEmployee);
            stmtEmployee.setInt(1, employeeId);
            ResultSet rsEmployee = stmtEmployee.executeQuery();

            if (rsEmployee.next()) {
                Employee employee = new Employee(
                    rsEmployee.getInt("id"),
                    rsEmployee.getString("name"),
                    rsEmployee.getString("email"),
                    rsEmployee.getString("phone"),
                    rsEmployee.getString("role"),
                    rsEmployee.getDouble("salary"),
                    rsEmployee.getInt("department_id"),
                    rsEmployee.getString("department_name") // Ensure departmentName is set correctly
                );
                request.setAttribute("employee", employee);
            }

            // Fetch the list of departments
            String sqlDepartment = "SELECT * FROM Department";
            PreparedStatement stmtDepartment = conn.prepareStatement(sqlDepartment);
            ResultSet rsDepartment = stmtDepartment.executeQuery();

            while (rsDepartment.next()) {
                Department department = new Department(
                    rsDepartment.getInt("id"),
                    rsDepartment.getString("name"));
                departments.add(department);
            }

            request.setAttribute("departments", departments); // Set the departments attribute
            request.getRequestDispatcher("/edit-employee.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        double salary = Double.parseDouble(request.getParameter("salary"));
        int departmentId = Integer.parseInt(request.getParameter("department_id"));

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE Employee SET name = ?, email = ?, phone = ?, role = ?, salary = ?, department_id = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, role);
            stmt.setDouble(5, salary);
            stmt.setInt(6, departmentId);
            stmt.setInt(7, id);
            stmt.executeUpdate();

            response.sendRedirect("/EmployeeManagementSystem/employees"); // Redirect after update
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
