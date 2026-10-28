<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Inventory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/logo.png" alt="Logo" width="150" height="60" class="d-inline-block align-text-top">
            Inventory Management
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <button class="btn btn-outline-light ms-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar">
            ☰ Menu
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="offcanvas offcanvas-start" tabindex="-1" id="sidebar">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="navbarNavMenuLabel">Menu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="list-unstyled">
            <li><a href="#" class="text-decoration-none">Dashboard</a></li>
            <li><a href="#" class="text-decoration-none">Products</a></li>
            <li><a href="#" class="text-decoration-none">Orders</a></li>
            <li><a href="#" class="text-decoration-none">Reports</a></li>
        </ul>
    </div>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0 text-center">Login</h4>
                </div>
                <div class="card-body">
                    <form id="loginForm">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                    <div id="loginMessage" class="mt-3"></div>
                </div>
                <div class="card-footer text-center">
                    <p class="mb-0">Don't have an account? <a href="Register">Register here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        
        const loginData = {
            email: email,
            password: password
        };
        
        fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(loginData)
        })
        .then(response => response.text())
        .then(data => {
            const messageDiv = document.getElementById('loginMessage');
            if (data === 'Login Successful') {
                messageDiv.innerHTML = '<div class="alert alert-success">' + data + '</div>';
                setTimeout(() => {
                    window.location.href = 'index.jsp';
                }, 1000);
            } else {
                messageDiv.innerHTML = '<div class="alert alert-danger">' + data + '</div>';
            }
        })
        .catch(error => {
            const messageDiv = document.getElementById('loginMessage');
            messageDiv.innerHTML = '<div class="alert alert-danger">Error: ' + error + '</div>';
        });
    });
</script>
</body>
</html>
