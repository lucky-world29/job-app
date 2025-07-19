<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post a Job - Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .job-form-container {
            max-width: 650px;
            margin: auto;
            padding: 40px 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 12px 24px rgba(0,0,0,0.08);
        }
    </style>
</head>
<body>

<!-- 🔙 Top Nav -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">⬅ Job Portal</a>
    </div>
</nav>

<!-- 📝 Form Section -->
<div class="container mt-5">
    <div class="job-form-container">
        <h3 class="text-center mb-4 text-primary">📢 Post a New Job</h3>

        <form action="saveJob" method="post">
            <!-- Title -->
            <div class="mb-3">
                <label for="title" class="form-label">Job Title</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="e.g., Software Developer" required>
            </div>

            <!-- Company -->
            <div class="mb-3">
                <label for="company" class="form-label">Company Name</label>
                <input type="text" class="form-control" id="company" name="company" placeholder="e.g., Infosys, TCS" required>
            </div>

            <!-- Location -->
            <div class="mb-3">
                <label for="location" class="form-label">Location</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="e.g., Bengaluru, Delhi" required>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label for="description" class="form-label">Job Description</label>
                <textarea class="form-control" id="description" name="description" rows="5" placeholder="Describe the job role, skills required, etc." required></textarea>
            </div>

            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-success">✅ Post Job</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
