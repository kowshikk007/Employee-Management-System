<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Add Employee</title>
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #ffffff; /* Light text */
        }
        .alert-primary {
            background-color: #333333;
            color: #ffffff; /* White text for alert */
        }
        h2 {
            color: #ffffff; /* White text for headers */
        }
        .form-control {
            background-color: #2e2e2e;
            color: #ffffff; /* White text for input fields */
            border: 1px solid #444444;
        }
        .form-control:focus {
            background-color: #3e3e3e;
            border-color: #007bff;
            color: #ffffff; /* White text on focus */
        }
        .form-select {
            background-color: #2e2e2e;
            color: #ffffff; /* White text for select fields */
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
        .invalid-feedback {
            color: #ff6b6b; /* Feedback color for validation errors */
        }
        .alert-info {
            background-color: #444444;
            color: #ffffff; /* White text for info alerts */
            border-color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-primary text-center" role="alert">
            <h2>EMPLOYEE MANAGEMENT</h2>
        </div>
        <h2 class="mt-4">Add Employee</h2>

        <!-- Optional feedback message section -->
        <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/employees" method="POST" novalidate>
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
                <div class="invalid-feedback">Please enter the employee's name.</div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" required>
                <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <input type="text" class="form-control" id="role" name="role" required>
                <div class="invalid-feedback">Please enter the employee's role.</div>
            </div>

            <div class="mb-3">
                <label for="salary" class="form-label">Salary</label>
                <input type="number" class="form-control" id="salary" name="salary" min="0" step="0.01" required>
                <div class="invalid-feedback">Please enter a valid salary.</div>
            </div>

            <div class="mb-3">
                <label for="department_id" class="form-label">Department</label>
                <select class="form-select" id="department_id" name="department_id" required>
                    <option value="">Select Department</option>
                    <c:forEach var="department" items="${departments}">
                        <option value="${department.id}">${department.name}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Please select a department.</div>
            </div>

            <button type="submit" class="btn btn-primary">Add Employee</button>
            <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

    <script>
        (function () {
            'use strict'
            var forms = document.querySelectorAll('form')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
