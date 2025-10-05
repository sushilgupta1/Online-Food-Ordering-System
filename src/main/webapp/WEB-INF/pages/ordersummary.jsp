<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<title>Your Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">

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



	<section class="py-24 relative">
		<div class="w-full max-w-7xl px-4 md:px-5 lg-6 mx-auto">

			<h2
				class="font-manrope font-bold text-3xl sm:text-4xl leading-10 text-black mb-11">
				Your Order Confirmed</h2>
			<h6 class="font-medium text-xl leading-8 text-black mb-3">Hello,
				${name}</h6>
			<!-- <p class="font-normal text-lg leading-8 text-gray-500 mb-11">Your
				order has been completed and be delivery in only two days .</p> -->
			<div
				class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-8 py-6 border-y border-gray-100 mb-6">
				<div class="box group">
					<p
						class="font-normal text-base leading-7 text-gray-500 mb-3 transition-all duration-500 group-hover:text-gray-700">Order
						Date</p>
					<h6
						class="font-semibold font-manrope text-2xl leading-9 text-black">
						${item.orderDate.dayOfMonth}-${item.orderDate.month}-${item.orderDate.year}</h6>
				</div>
				<div class="box group">
					<p
						class="font-normal text-base leading-7 text-gray-500 mb-3 transition-all duration-500 group-hover:text-gray-700">Order</p>
					<h6
						class="font-semibold font-manrope text-2xl leading-9 text-black">#${item.orderid
						}</h6>
				</div>
				<div class="box group">
					<p
						class="font-normal text-base leading-7 text-gray-500 mb-3 transition-all duration-500 group-hover:text-gray-700">Payment
						Method</p>
					<img src="photo/cod.png" alt="cod" width="80" height="70"
						align="top">
					
				
				</div>
				<div class="box group">
					<p
						class="font-normal text-base leading-7 text-gray-500 mb-3 transition-all duration-500 group-hover:text-gray-700">Address</p>
					<h6
						class="font-semibold font-manrope text-2xl leading-9 text-black">
						${item.deliveryaddress}</h6>
				</div>
			</div>
			<c:choose>
				<c:when test="${!empty item}">
					<c:forEach var="food" items="${item.orderItems}">
						<div class="grid grid-cols-7 w-full pb-6 border-b border-gray-100">
							<div class="col-span-7 min-[500px]:col-span-2 md:col-span-1">
								<img src="data:image/png;base64,${food.food.base64}"
									alt="Skin Care Kit image"
									class="w-full rounded-xl object-cover">
							</div>
							<div
								class="col-span-7 min-[500px]:col-span-5 md:col-span-6 min-[500px]:pl-5 max-sm:mt-5 flex flex-col justify-center">
								<div
									class="flex flex-col min-[500px]:flex-row min-[500px]:items-center justify-between">
									<div class="">
										<h5
											class="font-manrope font-semibold text-2xl leading-9 text-black mb-6">
											&nbsp;&nbsp;&nbsp;${food.food.foodname}</h5>
										<p class="font-normal text-xl leading-8 text-gray-500">
											&nbsp;&nbsp;&nbsp;&nbsp;Quantity : <span
												class="text-black font-semibold">${food.quantity}</span>
										</p>
									</div>
									<div
										class="flex items-center justify-around w-full sm:pl-28 lg:pl-0">
										<div
											class="flex flex-col justify-center items-start max-sm:items-center">
											<p
												class="font-normal text-lg text-gray-500 leading-8 mb-2 text-left whitespace-nowrap">
												Status</p>
											<p
												class="font-semibold text-lg leading-8 text-left whitespace-nowrap"
												style="color: ${item.status == 'Cancelled'||item.status == 'cancelled' ? 'red' : 'green'};">
												${item.status}</p>
										</div>
									</div>

									<h5
										class="font-manrope font-semibold text-3xl leading-10 text-black sm:text-right mt-3">
										<span>&#x20B9;</span> ${food.price}
									</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>



			<!-- <div class="grid grid-cols-7 w-full py-6 border-b border-gray-100">
				<div class="col-span-7 min-[500px]:col-span-2 md:col-span-1">
					<img src="https://pagedone.io/asset/uploads/1701167697.png"
						alt="Skin Tone Serum image" class="w-full rounded-xl object-cover">
				</div>
				<div
					class="col-span-7 min-[500px]:col-span-5 md:col-span-6 min-[500px]:pl-5 max-sm:mt-5 flex flex-col justify-center">
					<div
						class="flex flex-col min-[500px]:flex-row min-[500px]:items-center justify-between">
						<div class="">
							<h5
								class="font-manrope font-semibold text-2xl leading-9 text-black mb-6">Skin
								Tone Serum</h5>
							<p class="font-normal text-xl leading-8 text-gray-500">
								Quantity : <span class="text-black font-semibold">1</span>
							</p>
						</div>

						<h5
							class="font-manrope font-semibold text-3xl leading-10 text-black sm:text-right mt-3">
							$325.00</h5>
					</div>
				</div>
			</div> -->


			<div
				class="flex items-center justify-center sm:justify-end w-full my-6">
				<div class=" w-full">
					<div class="flex items-center justify-between mb-6">
						<p class="font-normal text-xl leading-8 text-gray-500">Subtotal</p>
						<p class="font-semibold text-xl leading-8 text-gray-900">
							<span>&#x20B9;</span>${item.price}</p>
					</div>
					<div class="flex items-center justify-between mb-6">
						<p class="font-normal text-xl leading-8 text-gray-500">Shipping
							Charge</p>
						<p class="font-semibold text-xl leading-8 text-gray-900">
							<span>&#x20B9;</span>${item.delivery}</p>
					</div>
					<!-- <div class="flex items-center justify-between mb-6">
						<p class="font-normal text-xl leading-8 text-gray-500">Taxes</p>
						<p class="font-semibold text-xl leading-8 text-gray-900">$50.00</p>
					</div> -->
					<div class="flex items-center justify-between mb-6">
						<p class="font-normal text-xl leading-8 text-gray-500">Discount</p>
						<p class="font-semibold text-xl leading-8 text-gray-900">
							<span>&#x20B9;</span>${item.discount}</p>
					</div>
					<hr>
					<div
						class="flex items-center justify-between py-6 border-y border-gray-100">

						<p
							class="font-manrope font-semibold text-2xl leading-9 text-gray-900">Total</p>
						<p
							class="font-manrope font-bold text-2xl leading-9 text-indigo-600">
							<span>&#x20B9;</span>${item.finalprice}</p>
					</div>
				</div>
			</div>
			<div class="data ">

				<h6 align="center"
					class="font-manrope font-bold text-2xl leading-9 text-black mb-3">Thank
					you for shopping with us!</h6>

			</div>
		</div>
	</section>

</body>
</html>
