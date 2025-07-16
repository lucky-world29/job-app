<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Post a New Job</h2>
    <form action="saveJob" method="post">
        <div class="mb-3">
            <label for="title" class="form-label">Job Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="mb-3">
            <label for="company" class="form-label">Company Name</label>
            <input type="text" class="form-control" id="company" name="company" required>
        </div>
        <div class="mb-3">
            <label for="location" class="form-label">Location</label>
            <input type="text" class="form-control" id="location" name="location" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Job Description</label>
            <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Post Job</button>
    </form>
</div>
</body>
</html>
