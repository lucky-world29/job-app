
 
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jobapp.model.Job" %> <%-- Adjust package as needed --%>

<%
    List<Job> jobList = (List<Job>) request.getAttribute("jobs");
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Jobs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Available Job Listings</h2>
    <div class="row">
        <%
            if (jobList != null && !jobList.isEmpty()) {
                for (Job job : jobList) {
        %>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><%= job.getTitle() %></h5>
                    <h6 class="card-subtitle mb-2 text-muted"><%= job.getCompany() %> - <%= job.getLocation() %></h6>
                    <p class="card-text"><%= job.getDescription() %></p>
                </div>
            </div>
        </div>
        <% 
                } 
            } else { 
        %>
        <p class="text-center">No jobs found.</p>
        <% } %>
    </div>
</div>
</body>
</html>
 