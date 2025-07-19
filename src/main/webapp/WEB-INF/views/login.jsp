<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f3f4f6, #dbeafe);
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .login-container {
            max-width: 420px;
        }
        .brand-logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card p-4 login-container">
        <h3 class="text-center mb-3 brand-logo">🔐 Job Portal Login</h3>

        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger text-center">${sessionScope.error}</div>
            <c:remove var="error" scope="session"/>
        </c:if>

        <form action="login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">👤 Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required />
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">🔒 Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required />
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>

        <p class="text-center mt-3 mb-0">
            Don't have an account?
            <a href="register" class="text-decoration-none fw-semibold">Register here</a>
        </p>
    </div>
</div>
</body>
</html>
