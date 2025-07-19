<%@ page import="java.util.*, java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<com.example.jobapp.model.Job> jobList = (List<com.example.jobapp.model.Job>) request.getAttribute("jobs");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Jobs - Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .job-card {
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }
        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .search-input {
            max-width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="container mt-5 pt-4">
    <h2 class="text-center mb-4">📋 Current Job Openings</h2>

    <!-- 🔍 Search Bar -->
    <div class="mb-4 search-input">
        <input type="text" class="form-control shadow-sm" id="searchInput" placeholder="Search by Title, Company, or Location...">
    </div>

    <!-- 🧾 Job Cards -->
    <div class="row" id="jobListContainer">
        <% if (jobList != null && !jobList.isEmpty()) {
            for (com.example.jobapp.model.Job job : jobList) { %>
            
            <% 
    String role = (String) session.getAttribute("role");
    if (role == null || (!"ADMIN".equals(role) && !"USER".equals(role))) {
        response.sendRedirect("login");
    }
%>
            

            <div class="col-md-4 mb-4 job-card">
                <div class="card border-0 shadow-sm job-item">
                    <div class="card-body">
                        <h5 class="card-title job-title fw-bold text-primary"><%= job.getTitle() %></h5>
                        <p class="text-muted job-company mb-1">🏢 <%= job.getCompany() %></p>
                        <p class="job-location">📍 <%= job.getLocation() %></p>
                        <p class="text-muted small mb-3">
                            <%= (job.getDatePosted() != null)
                                ? "📅 Posted on: " + job.getDatePosted().format(formatter)
                                : "📅 Posted on: Unknown" %>
                        </p>
                        <a href="editjob?id=<%= job.getId() %>" class="btn btn-sm btn-warning me-2">✏️ Edit</a>
                        <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<%= job.getId() %>">🗑️ Delete</button>
                    </div>
                </div>
            </div>

            <!-- 🗑️ Delete Modal -->
            <div class="modal fade" id="deleteModal<%= job.getId() %>" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content shadow">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirm Deletion</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete "<strong><%= job.getTitle() %></strong>"?
                        </div>
                        <div class="modal-footer">
                            <a href="deletejob?id=<%= job.getId() %>" class="btn btn-danger">Yes, Delete</a>
                            <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>

        <% }} else { %>
            <p class="text-center">🚫 No jobs available at the moment.</p>
        <% } %>
    </div>
</div>

<!-- ✅ Toast on Job Deletion -->
<%
    String toast = request.getParameter("toast");
    if ("deleted".equals(toast)) {
%>
<script>
    window.onload = () => {
        const toast = document.createElement('div');
        toast.innerText = "✅ Job deleted successfully!";
        toast.style.cssText = "position:fixed;bottom:30px;right:30px;background:#198754;color:white;padding:12px 20px;border-radius:10px;box-shadow:0 5px 15px rgba(0,0,0,0.1);z-index:9999;font-weight:500;";
        document.body.appendChild(toast);
        setTimeout(() => toast.style.opacity = '0', 2500);
        setTimeout(() => toast.remove(), 3000);
    };
</script>
<% } %>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let query = this.value.toLowerCase();
        let jobs = document.querySelectorAll(".job-item");

        jobs.forEach(job => {
            let title = job.querySelector(".job-title").textContent.toLowerCase();
            let company = job.querySelector(".job-company").textContent.toLowerCase();
            let location = job.querySelector(".job-location").textContent.toLowerCase();

            job.closest(".col-md-4").style.display =
                (title.includes(query) || company.includes(query) || location.includes(query)) ? "block" : "none";
        });
    });
</script>

</body>
</html>
