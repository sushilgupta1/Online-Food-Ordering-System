<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>Admin Login Page</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Eye Icon -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Nunito', sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            
        }
        
        .admin-login-container {
            width: 450px;
            padding: 40px;
            background-color: #fff4b5;
            box-shadow: 0 19px 38px rgba(0, 0, 0, 0.3), 0 15px 12px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            text-align: center;
        }
        
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            color: #505f75;
        }

        .input-container {
            position: relative;
            width: 100%;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }

        .eye-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888;
        }

        .admin-login-btn {
            display: inline-block;
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            border-radius: 25px;
            background-color: #000;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }

        .admin-login-btn:hover {
            background-color: #333;
        }

        .forgot-pass {
            margin-top: 10px;
            font-size: 14px;
            color: #333;
            cursor: pointer;
        }

        .forgot-pass:hover {
            color: #000;
        }
    </style>

    <script>
        function togglePasswordVisibility() {
            var passwordInput = document.getElementById("adminPassword");
            var eyeIcon = document.getElementById("eyeIcon");
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }
    </script>
</head>
<body>
    <div class="admin-login-container">
            <!-- Error message if login fails -->
        <h5 style="color: red;">${msg}</h5>
        <h2>Admin Login</h2>
        <!-- Admin login form -->
        <frm:form modelAttribute="admin">
        <label for="adminUsername">Username</label>
        <frm:input path="emailid" required="required"/>
        <label for="adminPassword">Password</label>
         <div class="input-container">
        <frm:password path="password" id="adminPassword" name="password" required="required"/>
         <i class="fas fa-eye eye-icon" id="eyeIcon" onclick="togglePasswordVisibility()"></i>
         </div>
         <button type="submit" class="admin-login-btn">Login as Admin</button>
        </frm:form>
        
    </div>
</body>
</html>
