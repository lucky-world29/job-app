<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Posted Successfully!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
        }

        .success-container {
            margin-top: 100px;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 12px 24px rgba(0,0,0,0.1);
            max-width: 600px;
        }

        h2 {
            font-size: 28px;
        }

        .checkmark {
            font-size: 64px;
            color: #28a745;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="success-container text-center">
        <div class="checkmark">✅</div>
        <h2 class="text-success mt-3">Job Posted Successfully!</h2>
        <p class="lead">Your job is now live and visible to all users.</p>
        <div class="mt-4">
            <a href="/home" class="btn btn-outline-primary me-2">🏠 Home</a>
            <a href="/viewalljobs" class="btn btn-primary">📄 View Jobs</a>
        </div>
    </div>
</div>

</body>
</html>
