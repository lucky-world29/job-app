<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.time.format.DateTimeFormatter" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username == null || !"ADMIN".equals(role)) {
        response.sendRedirect("/login");
        return;
    }

    List<com.example.jobapp.model.Job> jobList = (List<com.example.jobapp.model.Job>) request.getAttribute("jobs");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        :root {
            --main-bg: #f4f7fe;
            --main-color: #6C63FF;
            --text-color: #2b2f4c;
        }
        body {
            background: var(--main-bg);
            font-family: 'Segoe UI', sans-serif;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            background: var(--main-color);
            padding-top: 20px;
            color: white;
        }
        .sidebar h4 {
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar a {
            color: white;
            padding: 12px 20px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #574b90;
        }
        .content {
            margin-left: 250px;
            padding: 2rem;
        }
        .card {
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .card:hover {
            transform: translateY(-4px);
        }
        .topbar {
            background: white;
            padding: 1rem;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .topbar span {
            font-weight: 500;
            color: var(--text-color);
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h4>⚙️ Admin Panel</h4>
    <a href="/home"><i class='bx bx-home'></i> Home</a>
    <a href="#"><i class='bx bx-line-chart'></i> Dashboard</a>
    <a href="/admin"><i class='bx bx-briefcase'></i> Manage Jobs</a>
    <a href="#"><i class='bx bx-user'></i> Users</a>
    <a href="/logout"><i class='bx bx-log-out'></i> Logout</a>
</div>

<div class="content">
    <div class="topbar">
        <h4>Welcome, Admin!</h4>
        <span>👤 <%= username %></span>
    </div>

    <div class="row mt-4">
        <div class="col-md-4 mb-4">
            <div class="card p-3 text-center bg-light">
                <h5>Total Jobs</h5>
                <h3><%= jobList != null ? jobList.size() : 0 %></h3>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card p-3 text-center bg-light">
                <h5>Users Registered</h5>
                <h3>128</h3>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card p-3 text-center bg-light">
                <h5>Reports</h5>
                <h3>8</h3>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3 mt-5">
        <h5>📋 Job Listings</h5>
        <a href="/addjob" class="btn btn-primary">➕ Post New Job</a>
    </div>

    <% if (jobList != null && !jobList.isEmpty()) { %>
        <div class="row">
            <% for (com.example.jobapp.model.Job job : jobList) { %>
                <div class="col-md-4 mb-4">
                    <div class="card p-3 bg-white">
                        <h5><%= job.getTitle() %></h5>
                        <h6 class="text-muted"><%= job.getCompany() %></h6>
                        <p><%= job.getLocation() %></p>
                        <% if (job.getDatePosted() != null) { %>
                            <small class="text-muted">Posted on <%= job.getDatePosted().format(formatter) %></small>
                        <% } %>
                        <div class="mt-2">
                            <a href="/editjob?id=<%= job.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                            <a href="/deletejob?id=<%= job.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } else { %>
        <div class="alert alert-info">No jobs found!</div>
    <% } %>

</div>
</body>
</html>
