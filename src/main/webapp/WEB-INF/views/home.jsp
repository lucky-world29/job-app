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
    <title>Job Portal - Home</title>
    <link rel="stylesheet" href="/style.css"> <!-- assuming CSS is in static folder -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Job Portal</a>
        <div>
            <a class="btn btn-primary" href="addjob">Post a Job</a>
            <a class="btn btn-success" href="viewalljobs">View Jobs</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="text-center my-4">Welcome to the Job Portal Of Lucky</h1>
    <p class="lead text-center">Yo ho ho! Find and post jobs easily with our simple interface.</p>
</div>
</body>
</html>
