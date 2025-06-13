<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Employees</title>
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #ffffff; /* Light text */
        }
        .alert-primary {
            background-color: #333333; /* Darker alert box */
            color: #ffffff; /* Light text in alert */
        }
        h2 {
            color: #ffffff; /* Light text */
        }
        .table {
            background-color: #2e2e2e; /* Dark table background */
            color: #ffffff; /* Light text for table */
        }
        .table-bordered {
            border: 1px solid #444444; /* Border color for table */
        }
        .table th, .table td {
            border: 1px solid #444444; /* Dark borders */
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #121212; /* Dark text on yellow button */
        }
        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #e0a800;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #ffffff; /* Light text on blue button */
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        a {
            color: #ffffff; /* Light text for links */
        }
        a:hover {
            color: #ffc107; /* Change color on hover */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-primary text-center" role="alert">
            <h2>EMPLOYEE MANAGEMENT</h2>
        </div>
        <h2 class="mt-4">Employee List</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Emp ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Salary</th>
                    <th>Department</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty employees}">
                    <tr>
                        <td colspan="8" class="text-center">No employees found.</td>
                    </tr>
                </c:if>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.email}</td>
                        <td>${employee.phone}</td>
                        <td>${employee.role}</td>
                        <td>${employee.salary}</td>
                        <td>${employee.departmentName}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/edit-employee?id=${employee.id}" class="btn btn-warning">Edit</a>
                            <a href="DeleteEmployee?id=${employee.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/departments" class="btn btn-primary">Add Employee</a>
    </div>
</body>
</html>
