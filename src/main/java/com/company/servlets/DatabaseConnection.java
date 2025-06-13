package com.company.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/employee__management";
    private static String jdbcUsername = "root"; // Adjust according to your username
    private static String jdbcPassword = "password"; // ARusdjust according to your password

    public static Connection getConnection() throws SQLException {
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.");
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }
}
