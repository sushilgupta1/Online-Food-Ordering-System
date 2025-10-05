<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@page import="com.nit.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Food Ordering</title>

<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* Styling for navbar */
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

/* Food cards styling */
.food-card {
	margin-bottom: 20px;
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

/* Image below navbar */
.header-image img {
	width: 100%;
	height: 140px;
}

.UserContainer {
	width: 90%;
	position: absolute;
	top: 450px;
	left: 5%;
}

.carousel-container {
	width: 99%; /* Full width */
	overflow: hidden; /* Ensure items don’t overflow */
	position: relative;
	margin-left: 10px;
	margin-top: 100px; /* Space for navbar */
}

.slider-wrapper {
	display: flex; /* Use flexbox to manage layout */
	position: relative;
	width: 100%; /* Full width for the wrapper */
}

.slider-wrapper .slide-button {
	position: absolute;
	top: 50%;
	outline: none;
	border: none;
	height: 50px;
	width: 50px;
	z-index: 5;
	color: #fff;
	display: flex;
	cursor: pointer;
	font-size: 2.2rem;
	background: #000;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	transform: translateY(-50%);
	transition: background 0.3s; /* Smooth transition for hover */
}

.slider-wrapper .slide-button:hover {
	background: #404040;
}

.slider-wrapper .slide-button#prev-slide {
	left: 10px; /* Adjusted for visibility */
}

.slider-wrapper .slide-button#next-slide {
	right: 10px; /* Adjusted for visibility */
}

.slider-wrapper .image-list {
	display: flex;
	gap: 18px;
	font-size: 0;
	list-style: none;
	margin: 0; /* Reset margin */
	padding: 0; /* Reset padding */
	overflow-x: auto;
	scrollbar-width: none;
}

.slider-wrapper .image-list::-webkit-scrollbar {
	display: auto;
}

.carousel-item {
	flex: 0 0 auto; /* Ensure the items are in a row */
	width: 200px; /* Adjust as needed */
	height: 200px; /* Adjust as needed */
	margin-right: 20px; /* Keep this consistent */
	display: flex;
	justify-content: center;
	align-items: center;
}

.carousel-item img {
	width: 80%;
	height: 80%;
	border-radius: 50%;
	object-fit: cover;
	overflow: auto;
}

/* Styles for mobile and tablets */
@media only screen and (max-width: 1023px) {
	.slider-wrapper .slide-button {
		display: none !important;
	}
	.slider-wrapper .image-list {
		gap: 10px;
		margin-bottom: 15px;
	}
	.slider-wrapper .image-list .image-item {
		width: 280px;
		height: 380px;
	}
}
.food-image {
    width: 100%; /* Ensures the image takes the full width of the card */
    height: 450px; /* Fixed height to keep all images the same size */
    object-fit: cover; /* Ensures the image covers the area without distortion */
    transition: transform 0.3s ease; /* Smooth transition for scaling effect */
}



</style>
</head>
<body>



	<!-- Navigation bar -->
	<!-- Navigation bar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="#"> <img src="photo/logo.webp"
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


	<!-- Header image below the navbar -->
	<div class="header-image" style="position: relative; top: 90px;">
		<img src="photo/last.webp" alt="Banner Image" width="100%">
	</div>

	<div class="carousel-container">
		<div class="slider-wrapper">
			<button id="prev-slide" class="slide-button material-symbols-rounded">
				<h1 align="center">&lt;</h1>
			</button>
			<div class="image-list">
				<div class="carousel-item">
					<img src="category/Chicken-Biryani.webp" alt="Biryani"
						onclick="window.location.href='category?type=Biryani';"
						style="cursor: pointer;">
				</div>
				<div class="carousel-item">
					<img src="category/pizza.webp" alt="Pizza"
						onclick="window.location.href='category?type=Pizza';"
						style="cursor: pointer;">
				</div>
				<div class="carousel-item">
					<img src="category/chicken.webp" alt="Chicken"
						onclick="window.location.href='category?type=Chicken';"
						style="cursor: pointer;">
				</div>
				<div class="carousel-item">
					<img src="category/burger.webp" alt="Burger"
						onclick="window.location.href='category?type=Burger';"
						style="cursor: pointer;">
				</div>
				<div class="carousel-item">
					<img src="category/icecream.webp" alt="Ice Cream"
						onclick="window.location.href='category?type=icecream';"
						style="cursor: pointer;">
				</div>
				<div class="carousel-item">
					<img src="category/fries.webp" alt="French Fries"
						onclick="window.location.href='category?type=French Fries';"
						style="cursor: pointer;">
				</div>
				<div class="carousel-item">
					<img src="category/drinks.webp" alt="Soft Drink"
						onclick="window.location.href='category?type=drink';"
						style="cursor: pointer;">
				</div>
			</div>
			<button id="next-slide" class="slide-button material-symbols-rounded">
				<h1 align="center">&gt;</h1>
			</button>
		</div>
	</div>

	<script>
const initSlider = () => {
    const imageList = document.querySelector(".slider-wrapper .image-list");
    const slideButtons = document.querySelectorAll(".slider-wrapper .slide-button");
    const maxScrollLeft = imageList.scrollWidth - imageList.clientWidth;
    
    // Handle scrollbar thumb drag (if you want to implement the scrollbar again)
    // (Assuming you still want this part)
    
    // Slide images according to the slide button clicks
    slideButtons.forEach(button => {
        button.addEventListener("click", () => {
            const direction = button.id === "prev-slide" ? -1 : 1;
            const scrollAmount = imageList.clientWidth * direction;
            imageList.scrollBy({ left: scrollAmount, behavior: "smooth" });
        });
    });
    
    // Show or hide slide buttons based on scroll position
    const handleSlideButtons = () => {
        slideButtons[0].style.display = imageList.scrollLeft <= 0 ? "none" : "flex";
        slideButtons[1].style.display = imageList.scrollLeft >= maxScrollLeft ? "none" : "flex";
    }

    // Call this function when image list scrolls
    imageList.addEventListener("scroll", handleSlideButtons);
}

// Initialize slider
window.addEventListener("resize", initSlider);
window.addEventListener("load", initSlider);

</script>



	<!-- Main content (scrollable vertically) -->
	<div class="UserContainer">
		<div class="row">
			<c:choose>
				<c:when test="${!empty allfood}">
					<c:forEach var="food" items="${allfood}">

						<div class="col-md-4 food-card">
    <div class="card">
        <!-- Display food image or placeholder -->
        <a href="getfood?foodid=${food.foodid}">
            <img
                src="data:image/png;base64,${food.base64}"
                alt="${food.foodname}" class="card-img-top food-image">
            <div class="card-body">
                <h5 class="card-title" style="color: #333; text-decoration: none;">${food.foodname}</h5>
        </a>
        <p class="card-text">${food.description}</p>
        <p class="food-price">
            <span>&#x20B9;</span> ${food.price - food.price * food.discount / 100}
            <span class="food-discount">${food.price}</span> <span class="discount-percent">${food.discount}% off</span>
        </p>
        <div align="center">
            <a href="addcart?foodid=${food.foodid}" class="btn btn-primary" style="color: white; text-decoration: none;"> Add To Cart
            </a>
        </div>
    </div>
</div>

		</div>

		</c:forEach>
		</c:when>
		<c:otherwise>
			<p>No food items available</p>
		</c:otherwise>
		</c:choose>

	</div>


</body>
</html>
