<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Database Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #ffffff; /* Light text */
        }
        h2 {
            color: #ffffff; /* Light text for headings */
        }
        table {
            background-color: #2e2e2e; /* Dark table background */
            color: #ffffff; /* Light text for table */
            border: 1px solid #444444; /* Darker border */
        }
        th, td {
            border: 1px solid #444444; /* Dark borders */
            color: #ffffff; /* Ensure light text for both th and td */
        }
        th {
            background-color: #333333; /* Darker header */
            color: #ffffff; /* Light text in header */
        }
        .alert {
            background-color: #1e1e1e; /* Dark background for alerts */
            color: #ffffff; /* Light text for alerts */
        }
    </style>
</head>
<body>

<h2 class="text-center mt-4">Data from Database</h2>

<div class="container mt-4">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>

<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/employee_management";
    String username = "root";
    String password = "amaresh";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(url, username, password);
        out.println("<div class='alert alert-info'>Database connected successfully!</div>");

        // Create a statement
        stmt = conn.createStatement();

        // Execute the query
        String query = "SELECT id, name, email FROM Employee";
        out.println("<div class='alert alert-info'>Executing query: " + query + "</div>");

        rs = stmt.executeQuery(query);

        // Check if ResultSet has data
        if (!rs.isBeforeFirst()) {
            out.println("<tr><td colspan='3' class='text-center'>No data found!</td></tr>");
        } else {
            // Iterate through the result set
            while (rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
<%
            }
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='3' class='text-center'>Error: " + e.getMessage() + "</td></tr>");
        e.printStackTrace();
    } finally {
        // Close the resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

        </tbody>
    </table>
</div>

</body>
</html>
