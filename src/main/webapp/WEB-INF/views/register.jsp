<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0f2fe, #fef9c3);
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .register-container {
            max-width: 440px;
        }
        .brand-logo {
            font-size: 1.6rem;
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-semibold" href="/home">🏠 Job Portal</a>
    </div>
</nav>

<!-- Registration Card -->
<div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card p-4 register-container">
        <h4 class="text-center mb-3 brand-logo">📝 Create an Account</h4>

        <% String error = (String) session.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger text-center"><%= error %></div>
            <% session.removeAttribute("error"); %>
        <% } %>

        <form action="/register" method="post">
            <div class="mb-3">
                <label class="form-label">👤 Username</label>
                <input type="text" name="username" required class="form-control" placeholder="Choose a username">
            </div>

            <div class="mb-3">
                <label class="form-label">🔐 Password</label>
                <input type="password" name="password" required class="form-control" placeholder="Create a password">
            </div>

            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>

        <div class="mt-3 text-center">
            Already have an account? <a href="/login" class="text-decoration-none fw-semibold">Login here</a>
        </div>
    </div>
</div>

</body>
</html>
