<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<title>Add Product</title>
<!-- Tailwind CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
.bg-cover {
	background-image: url('/photo/foodbanner.jpg');
	/* Path to your background image */
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	min-height: 100vh;
}

/* Overlay and content styling */
.overlay {
	background-color: rgba(0, 0, 0, 0.7);
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 0;
}

.navbar {
	background-color: #FF6D00;
	padding: 1rem 0;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	font-family: 'Nunito', sans-serif;
}

.nav-logo {
	display: flex;
	align-items: center;
}

.nav-logo img {
	height: 45px;
	width: 45px;
	margin-right: 0.5rem;
}

.nav-link {
	color: white;
	font-size: 1.1rem;
	transition: color 0.3s ease-in-out, transform 0.2s;
}

.nav-link:hover {
	color: #FFD700;
	transform: scale(1.1);
}

.total-selling {
	color: white;
	font-weight: bold;
	font-size: 1rem;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 0.5rem 1rem;
	border-radius: 5px;
}

<
style>.form-label {
	display: block;
	font-size: 1rem;
	font-weight: bold;
	color: #FFD700; /* Gold color for better readability */
	margin-bottom: 0.5rem;
}

.form-input {
	width: 100%;
	padding: 0.75rem;
	background-color: #333;
	border: 1px solid #555;
	border-radius: 0.5rem;
	color: #F3F4F6; /* Light color for readability */
	margin-bottom: 1.5rem;
	font-size: 1rem;
	transition: border-color 0.2s ease-in-out;
}

.form-input:focus {
	border-color: #FFD700;
	outline: none;
	box-shadow: 0 0 8px rgba(255, 215, 0, 0.5);
}

.form-container {
	max-width: 28rem;
	margin-top: 5rem;
	background-color: rgba(31, 41, 55, 0.9);
	/* Semi-transparent dark background */
	padding: 2rem;
	border-radius: 1rem;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease-in-out;
}

.form-title {
	font-size: 2rem;
	color: #FFD700; /* Gold color */
	text-align: center;
	margin-bottom: 2rem;
	font-weight: 800;
}

.submit-btn {
	width: 100%;
	padding: 0.75rem;
	font-size: 1.2rem;
	font-weight: bold;
	color: #1F2937; /* Dark text */
	background-color: #FFD700; /* Gold button */
	border-radius: 0.5rem;
	cursor: pointer;
	transition: background-color 0.3s ease-in-out, transform 0.2s;
}

.submit-btn:hover {
	background-color: #FFC107; /* Lighter gold */
	transform: scale(1.05);
}
</style>

</head>

<body class="bg-cover  text-white flex  justify-center items-center">

	<!-- Dark overlay to enhance text readability over the background -->
	<div class="overlay"></div>
	<nav class="navbar fixed top-0 left-0 w-full z-50">
        <div class="container mx-auto flex items-center justify-between px-6">
            <div class="nav-logo">
                <img alt="logo" src="/photo/logo.webp">
                <h1 class="text-2xl font-bold tracking-wide text-white">Online Food Order</h1>
            </div>
            <!-- Navigation Links -->
            <div class="flex space-x-5 ">
            
                <a href="adminhome" class="nav-link ">Dashboard</a>
                <a href="allcustomers" class="nav-link">See All Customers</a>
                <a href="allorders" class="nav-link">See All Orders</a>
                <a href="addfooditem" class="nav-link">Add Food Item</a>
                <a href="manage" class="nav-link">Manage Items</a>
            </div>
            <div class="total-selling">
                Total Selling:<span style="color: green;"> &#x20B9;${admin.totalselling}</span>
            </div>
        </div>
    </nav>

	<div class="mt-5 max-w-xl mx-auto bg-gray-800 bg-opacity-70 p-8 rounded-xl shadow-xl transform transition duration-300">
    <!-- Display Message -->
    <p class="text-center text-yellow-400 font-semibold mb-6 text-lg">${msg}</p>

    <!-- Form Title -->
    <h2 class="form-title">Update Food Item</h2>

    <!-- Add Food Item Form -->
    <frm:form modelAttribute="food">
        <!-- Food Id (Read-only) -->
        <label class="form-label">Food Id</label>
        <frm:input path="foodid" readonly="true" class="form-input" />

        <!-- Food Name -->
        <label class="form-label">Food Name</label>
        <frm:input path="foodname" class="form-input" />

        <!-- Food Price -->
        <label class="form-label">Food Price</label>
        <frm:input path="price" class="form-input" />

        <!-- Discount -->
        <label class="form-label">Discount</label>
        <frm:input path="discount" class="form-input" />
        
        <frm:hidden path="description" />
        <frm:hidden path="category" />
        <frm:hidden path="foodimage" />

        <!-- Submit Button -->
        <button type="submit" class="submit-btn">Update Item</button>
    </frm:form>
</div>


</body>
</html>
