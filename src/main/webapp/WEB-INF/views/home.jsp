<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession currentSession = request.getSession(false);
    String username = (currentSession != null) ? (String) currentSession.getAttribute("username") : null;
    String role = (currentSession != null) ? (String) currentSession.getAttribute("role") : null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Lucky Job Portal - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        :root {
    --bg-light: #f5f7fa;
    --bg-dark: #0e0e12;
    --text-light: #1a1a1a;
    --text-dark: #ffffff;
    --card-bg-light: #ffffff;
    --card-bg-dark: #1f1f25;
    --btn-accent: #6c63ff;
}

body {
    font-family: 'Segoe UI', sans-serif;
    margin: 0;
    padding: 0;
    background: var(--bg-light);
    color: var(--text-light);
    transition: all 0.4s ease;
    overflow-x: hidden;
}

body.dark {
    background: var(--bg-dark);
    color: var(--text-dark);
}

.navbar {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.navbar-dark .navbar-nav .nav-link {
    color: var(--text-dark) !important;
}

.hero {
    position: relative;
    padding: 120px 20px 60px;
    text-align: center;
    z-index: 1;
    color: var(--text-dark);
}

body:not(.dark) .hero {
    color: var(--text-light);
}

.hero::before {
    content: "";
    position: absolute;
    top: -100px;
    left: 0;
    width: 100%;
    height: 130%;
    background: radial-gradient(circle at top left, #6c63ff, #3b3f63);
    animation: pulseBackground 10s ease-in-out infinite;
    z-index: -1;
}

@keyframes pulseBackground {
    0%, 100% { filter: brightness(1); }
    50% { filter: brightness(1.2); }
}

.card-custom {
    border: none;
    border-radius: 1rem;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    background: var(--card-bg-light);
    padding: 2rem;
    transition: background 0.4s, color 0.4s;
    color: var(--text-light);
}

body.dark .card-custom {
    background: var(--card-bg-dark);
    color: var(--text-dark);
}

.theme-toggle {
    background: none;
    border: none;
    color: var(--text-dark);
    font-size: 1.4rem;
    cursor: pointer;
}

body:not(.dark) .theme-toggle {
    color: var(--text-light);
}

.toast-container {
    z-index: 9999;
}
	
    </style>
</head>
<body>

<!-- 🌐 Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid px-4 d-flex justify-content-between align-items-center">
        <a class="navbar-brand fs-4 fw-semibold" href="/home">💼 Lucky Jobs</a>

        <div class="d-flex align-items-center gap-2">
            <a class="btn btn-success" href="viewalljobs">View Jobs</a>

            <% if (username != null) { %>
                <% if ("ADMIN".equals(role)) { %>
                    <a class="btn btn-primary" href="addjob">Post a Job</a>
                <% } %>
                <span class="text-white ms-3">👤 <strong><%= username %></strong> (<%= role %>)</span>
                <a class="btn btn-outline-light ms-2" href="logout">Logout</a>
            <% } else { %>
                <a class="btn btn-outline-light" href="login">Login</a>
            <% } %>

            <button class="theme-toggle ms-3" onclick="toggleTheme()" title="Toggle theme">
                <i class="bi bi-brightness-high-fill"></i>
            </button>
        </div>
    </div>
</nav>

<!-- 🎯 Hero -->
<section class="hero">
    <div class="container">
        <div class="card card-custom mx-auto" style="max-width: 750px;">
            <h1 class="mb-4">Welcome to Lucky's Job Portal</h1>
            <p class="mb-3">🌟 Your gateway to exciting careers and job opportunities.</p>
            <p class="mb-4">🚀 Post jobs, browse listings, and find your dream team or role!</p>

            <% if (username == null) { %>
    <div class="d-flex justify-content-center gap-3 flex-wrap mt-3">
        <a href="login" class="btn btn-outline-primary px-4">Login</a>
        <a href="register" class="btn btn-primary px-4">Register</a>
    </div>
<% } else { %>
    <a href="viewalljobs" class="btn btn-success btn-lg mt-3">Explore All Jobs</a>
<% } %>

        </div>
    </div>
</section>

<!-- ✅ Toast Message -->
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="toastMessage" class="toast align-items-center text-white bg-success border-0" role="alert">
        <div class="d-flex">
            <div class="toast-body">
                🎉 Job action completed successfully.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

<!-- 📦 Bootstrap + Theme Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleTheme() {
        document.body.classList.toggle('dark');
        localStorage.setItem('darkmode', document.body.classList.contains('dark'));
    }

    window.onload = () => {
        if (localStorage.getItem('darkmode') === 'true') {
            document.body.classList.add('dark');
        }

        const toast = document.getElementById('toastMessage');
        if (toast) new bootstrap.Toast(toast).show();
    };
</script>

</body>
</html>
