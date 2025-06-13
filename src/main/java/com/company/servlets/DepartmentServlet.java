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

@SuppressWarnings("serial")
public class DepartmentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DatabaseConnection.getConnection()) {
            List<Department> departments = new ArrayList<>();
            String sql = "SELECT id, name FROM Department";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Department department = new Department(rs.getInt("id"), rs.getString("name"));
                departments.add(department);
            }

            request.setAttribute("departments", departments);
            request.getRequestDispatcher("/add-employee.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
