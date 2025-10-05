<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>User Registration</title>
    
    <!-- Bootstrap 5 CDN for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #ffd700;
            height: 100vh; /* Full viewport height */
            font-family: Arial, sans-serif;
        }

        .register-container {
            background-color: white;
            padding: 20px;
            width:40%;
            height:88%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<!-- Centering the content both horizontally and vertically -->
<div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="register-container">
        <h2 class="text-center">User Registration</h2>
        <form action="register" method="post">
            <div class="form-group">
                <label for="firstname">First Name</label>
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter First Name" required>
            </div>
            <div class="form-group">
                <label for="lastname">Last Name</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Last Name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
                <label for="contactnumber">Contact Number</label>
                <input type="text" class="form-control" id="contactnumber" name="contactnumber" placeholder="Enter Contact Number" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter Address" required></textarea>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block w-100">Register</button>
        </form>

        <!-- Link for new users to login -->
        <p class="text-center mt-3">Already have an account? <a href="./">Login here</a></p>
    </div>
</div>

</body>
</html>
