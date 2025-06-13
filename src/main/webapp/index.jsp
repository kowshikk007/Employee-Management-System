<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <title>Employee Management System</title>
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #ffffff; /* Light text */
        }
        .hero-container {
            background-color: #1e1e1e; /* Dark container */
            border-radius: 10px; 
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1); 
            padding: 40px; 
            margin-top: 50px; 
            text-align: center; /* Center align the content */
        }
        .hero-text {
            font-size: 4rem; /* Reduced font size for better mobile fit */
            font-weight: bold;
            color: #ffffff; 
            font-family: 'Roboto', sans-serif;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .custom-navbar {
            background-color: #333333; /* Darker navbar */
            box-shadow: 0 4px 10px rgba(255, 255, 255, 0.1); 
        }
        .navbar-brand {
            color: #ffffff !important; 
        }
        .btn-light {
            background-color: #4e4e4e !important; 
            color: #ffffff !important; 
        }
        .btn-light:hover {
            background-color: #616161 !important; 
            color: #ffffff !important; /* Ensure light text on hover */
        }
        .modal-content {
            background-color: #1e1e1e;
            color: #ffffff;
        }
        .form-control {
            background-color: #2e2e2e;
            color: #ffffff;
            border: 1px solid #444444; 
        }
        .form-control:focus {
            background-color: #3e3e3e;
            border-color: #007bff;
            color: #ffffff; /* Light text when focused */
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #ffffff; /* Ensure light text */
        }
        .btn-primary:hover {
            background-color: #0056b3;
            color: #ffffff; /* Keep text light on hover */
        }
        .btn-custom {
            background-color: #444444; /* Custom button color */
            color: #ffffff;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Home Page</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content Container -->
    <div class="container mt-5 pt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="hero-container">
                    <div class="hero-text">
                        EMPLOYEE <br> MANAGEMENT <br> SYSTEM
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Admin Login</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/admin-login" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
