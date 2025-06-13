<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Edit Employee</title>
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #ffffff; /* Light text */
        }
        .alert-primary {
            background-color: #333333;
            color: #ffffff; /* White text for alerts */
        }
        h2 {
            color: #ffffff; /* Ensure headers are white */
        }
        .form-control {
            background-color: #2e2e2e;
            color: #ffffff; /* White text for form controls */
            border: 1px solid #444444;
        }
        .form-control:focus {
            background-color: #3e3e3e;
            border-color: #007bff;
            color: #ffffff; /* White text on focus */
        }
        .form-select {
            background-color: #2e2e2e;
            color: #ffffff; /* White text for select options */
            border: 1px solid #444444;
        }
        .form-select:focus {
            background-color: #3e3e3e;
            border-color: #007bff;
            color: #ffffff; /* White text on focus */
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-primary text-center" role="alert">
            <h2>EMPLOYEE MANAGEMENT</h2>
        </div>
        <h2 class="mt-4">Edit Employee</h2>

        <form action="${pageContext.request.contextPath}/edit-employee" method="post">
            <input type="hidden" name="id" value="${employee.id}">
            
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" name="name" id="name" value="${employee.name}" required>
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" value="${employee.email}" required>
            </div>
            
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone" id="phone" value="${employee.phone}" required>
            </div>
            
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <input type="text" class="form-control" name="role" id="role" value="${employee.role}" required>
            </div>
            
            <div class="mb-3">
                <label for="salary" class="form-label">Salary</label>
                <input type="number" step="0.01" class="form-control" name="salary" id="salary" value="${employee.salary}" required>
            </div>
            
            <div class="mb-3">
                <label for="department_id" class="form-label">Department</label>
                <select class="form-select" name="department_id" id="department_id" required>
                    <c:forEach var="department" items="${departments}">
                        <option value="${department.id}" <c:if test="${department.id == employee.departmentId}">selected</c:if>>${department.name}</option>
                    </c:forEach>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Employee</button>
            <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
