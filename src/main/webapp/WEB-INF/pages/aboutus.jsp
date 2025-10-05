<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<title>About Us</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<style>
        .container
        {
        margin-top: 110px;
        }
        .image
        {
            display: flex;
        }
        .imag1
        {
            height: 520px;
            width: 250px;
            border-radius: 150px;
            object-fit: cover;
            margin-right: 20px;
        }
        .imag2
        {
            height: 250px;
            width: 250px;
            border-radius: 50% 50% 50% 0%;
            object-fit: cover;
        }
        .imag3
        {
            margin-top: 20px;
            height: 250px;
            width: 250px;
            border-radius: 0% 50% 50% 50%;
            object-fit: cover;
        }
        .content {
            position: relative;
            z-index: 2;
        }
         
       .navbar {
	background-color: #ffd700; /* Consistent background color */
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}

.navbar-brand {
	display: flex; /* Use flexbox for alignment */
	align-items: center; /* Center items vertically */
}

.navbar-brand img {
	height: 50px;
	width: 50px;
	margin-right: 8px;
}

.navbar-nav .nav-link {
	color: black; /* Set text color to black */
	margin-right: 15px;
	font-weight: 500;
}

.navbar-nav .nav-link:hover {
	color: #333; /* Darker on hover */
}

.badge {
	font-size: 0.7rem; /* Adjust the font size as needed */
	padding: 0.2em 0.5em; /* Adjust padding */
}

/* Fixed sidebar categories */
.sidebar {
	position: fixed;
	top: 130px;
	left: 0;
	width: 220px;
	height: calc(100vh - 130px);
	overflow-y: auto;
	background-color: #f8f8f8;
	padding: 10px;
	border-right: 1px solid #ddd;
	z-index: 900;
}

/* Sidebar categories styling */
.categories {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.categories li {
	padding: 10px;
	font-size: 18px;
	border-bottom: 1px solid #ddd;
	transition: background-color 0.3s, color 0.3s;
}

.categories li:last-child {
	border-bottom: none;
}

.categories li:hover:not(.all-categories) {
	background-color: #ffcc00;
	color: white;
	cursor: pointer;
}

.categories li.all-categories {
	background-color: #ffcc00;
	color: white;
	font-weight: bold;
}

/* Fixed sidebar categories */
.sidebar {
	position: fixed;
	top: 130px;
	left: 0;
	width: 220px;
	height: calc(100vh - 130px);
	overflow-y: auto;
	background-color: #f8f8f8;
	padding: 10px;
	border-right: 1px solid #ddd;
	z-index: 900;
}

/* Sidebar categories styling */
.categories {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.categories li {
	padding: 10px;
	font-size: 18px;
	border-bottom: 1px solid #ddd;
	transition: background-color 0.3s, color 0.3s;
}

.categories li:last-child {
	border-bottom: none;
}

.categories li:hover:not(.all-categories) {
	background-color: #ffcc00;
	color: white;
	cursor: pointer;
}

.categories li.all-categories {
	background-color: #ffcc00;
	color: white;
	font-weight: bold;
}

/* Content area */
.main-content {
	margin-left: 240px;
	margin-top: 150px;
	padding: 10px;
}
.describe
{
	margin-left: 100px;
	color: black;
	font-family: 'Nunito', sans-serif;
	
}
.bord
{
	margin-top:15px;
	margin-right:15px;
	height:50px;
	width:230px;
	border: 1px solid #adb5bd;
	border-radius: 15px;
	padding: 10px;
	padding-left: 30px;
}
</style>
</head>
<body class="bg-cover text-white flex items-center justify-center">
    
 <nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="home"> <img src="photo/logo.webp"
			alt="Logo"> Online Food Ordering
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
				<!-- Home link added here -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false">Categories</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="category?type=All">All</a></li>
						<li><a class="dropdown-item" href="category?type=Veg">Veg</a></li>
						<li><a class="dropdown-item" href="category?type=Biryani">Biryani</a></li>
						<li><a class="dropdown-item" href="category?type=Chicken">Chicken</a></li>
						<li><a class="dropdown-item" href="category?type=Pizza">Pizza</a></li>
						<li><a class="dropdown-item" href="category?type=Beverages">Beverages</a></li>
						<li><a class="dropdown-item" href="category?type=Fish">Fish</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="order">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="aboutus">About
						Us</a></li>
			</ul>
			<form class="d-flex ms-auto" action="search">
				<input class="form-control me-2" type="search"
					placeholder="Search Food" aria-label="Search" name="value">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
			<ul class="navbar-nav ms-auto">
				<li class="nav-item position-relative"><a
					class="nav-link d-flex align-items-center" href="cart"> <img
						src="photo/cart.webp" alt="Cart"
						style="width: 24px; height: 24px; margin-right: 5px; margin-bottom: -3px">
						<!-- Adjust margin-right for spacing --> Cart <span
						class="badge bg-danger position-absolute"
						style="top: 2px; right: 60px; font-size: 0.7rem;">${count}</span>
				</a></li>


				<li class="nav-item" style="color: black;">Welcome, ${name}</li>
				<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
			</ul>
		</div>
	</nav>
 
<div class="container">
    <div class="image" >
        <div class="bigimg">
            <img src="photo/biryani_one.webp" alt="" class="imag1">
        </div>
        <div>
            <div>
                <img src="photo/burger_two.webp" alt="" class="imag2">
            </div>
            <div>
                <img src="photo/icecream_three.webp" alt="" class="imag3">
            </div>
        </div>
        <div class="describe" style="padding-top: 50px;">
        	<h5 style="color: blue;">WHO WE ARE </h5>
        	<h2>Bringing Yours Flavors That Delight</h2>
        	<p style="font-weight: 20;">Experience a culinary journey like no other with our menu, where every dish is crafted to delight your senses. We're dedicated to bringing you flavors that excite, with fresh ingredients and authentic recipes that leave a lasting impression.</p>
        	<div>
        	<div style="display: flex;">
        	<div class="bord">
        	<p><span style="color: #6610f2; font-weight: bolder;">90%</span>  Repeat Customer</p>
        	</div>
        	<div class="bord">
        	<p><span style="color: #6610f2; font-weight: bolder;">94%</span>  Freshness & Quality</p>
        	</div>
        	</div>
        	<div style="display: flex;">
        	<div class="bord">
        	<p><span style="color: #6610f2; font-weight: bolder;">20 min</span>  min Delivery Time</p>
        	</div>
        	<div class="bord">
        	<p><span style="color: #6610f2; font-weight: bolder;">500+</span>  Positive Review</p>
        	</div>
        	</div>
       </div>
        </div>
    </div>
</div>

</body>
</html>