<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Job - Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .edit-job-container {
            max-width: 650px;
            margin: 60px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 12px 24px rgba(0,0,0,0.08);
        }

        h3 {
            color: #0d6efd;
        }
    </style>
</head>
<body>

<!-- 🔙 Navbar -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">⬅ Job Portal</a>
    </div>
</nav>

<!-- 📝 Edit Job Form -->
<div class="edit-job-container">
    <h3 class="text-center mb-4">✏️ Edit Job</h3>

    <form:form action="saveJob" method="post" modelAttribute="job">
        <!-- Hidden ID Field -->
        <form:hidden path="id"/>

        <!-- Job Title -->
        <div class="mb-3">
            <label class="form-label">Job Title</label>
            <form:input path="title" cssClass="form-control" placeholder="Enter job title"/>
        </div>

        <!-- Company -->
        <div class="mb-3">
            <label class="form-label">Company</label>
            <form:input path="company" cssClass="form-control" placeholder="Enter company name"/>
        </div>

        <!-- Location -->
        <div class="mb-3">
            <label class="form-label">Location</label>
            <form:input path="location" cssClass="form-control" placeholder="Enter job location"/>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label class="form-label">Description</label>
            <form:textarea path="description" cssClass="form-control" rows="5" placeholder="Enter job details"/>
        </div>

        <!-- Submit Button -->
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">💾 Update Job</button>
        </div>
    </form:form>
</div>

</body>
</html>
