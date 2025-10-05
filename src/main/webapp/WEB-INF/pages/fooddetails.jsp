<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<title>Food Details</title>
<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* Styling for navbar */
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

.container {
	margin-top: 100px;
}

.card {
	display: flex;
	flex-direction: row;
	align-items: center;
}

.card img {
	max-width: 100%;
	height: auto;
	max-height: 300px;
}

.food-details {
	padding-left: 20px;
}

.btn-primary {
	margin-top: 10px;
}

.food-price {
	font-size: 1.2em;
	font-weight: bolder;
	font-size: 22px;
}

.food-discount {
	color: red;
	text-decoration: line-through;
	font-weight: lighter;
	font-size: 15px;
}

.discount-percent {
	color: green;
}

a {
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>

	<!-- Navigation bar -->
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


				<li class="nav-item">Welcome, ${name}</li>
				<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
			</ul>
		</div>
	</nav>


	<div class="container">
		<div class="row d-flex align-items-center">
			<div class="col-md-4">
				<!-- Image on the left side -->
				<img src="data:image/png;base64,${food.base64}"
					alt="${food.foodname}" class="img-fluid">
			</div>

			<div class="col-md-8 food-details">
				<!-- Food details on the right side of the image -->
				<h5 class="card-title">${food.foodname}</h5>
				<p class="card-text">${food.description}</p>
				<p class="food-price">
					<span>&#x20B9;</span>${food.price - food.price * food.discount / 100} <span
						class="food-discount">${food.price}</span> <span
						class="discount-percent">${food.discount}% off</span>
				</p>
				<div class="btn btn-primary">
					<a href="addcart?foodid=${food.foodid}">Add To Cart</a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
