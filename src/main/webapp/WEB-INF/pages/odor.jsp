<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<title>Order</title>
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
		<div class="w-full max-w-7xl mx-auto px-4 md:px-8">
			<h2
				class="font-manrope font-extrabold text-3xl lead-10 text-black mb-9">Order
				History</h2>

			
			<h4 align="center" style="color: red;">${error}</h4>
			<c:choose>
				<c:when test="${!empty order}">
					<c:forEach var="item" items="${order}">

						<div class="mt-7 border border-gray-300 pt-9">
							<div
								class="flex max-md:flex-col items-center justify-between px-3 md:px-11">
								<div class="data">
									<p
										class="font-medium text-lg leading-8 text-black whitespace-nowrap">Order
										: #${item.orderid}</p>
									<p
										class="font-medium text-lg leading-8 text-black mt-3 whitespace-nowrap">Order
										Date :
										${item.orderDate.dayOfMonth}-${item.orderDate.month}-${item.orderDate.year}</p>
								</div>
								<div class="flex items-center gap-3 max-md:mt-5">
									<a href="invoice?orderid=${item.orderid}"><button
											class="rounded-full px-7 py-3 bg-white text-gray-900 border border-gray-300 font-semibold text-sm shadow-sm shadow-transparent transition-all duration-500 hover:shadow-gray-200 hover:bg-gray-50 hover:border-gray-400">Show
											Invoice</button></a>
									
								</div>
							</div>

							<c:choose>
								<c:when test="${!empty item.orderItems}">
									<c:forEach var="orderdata" items="${item.orderItems}">

										<svg class="my-9 w-full" xmlns="http://www.w3.org/2000/svg"
											width="1216" height="2" viewBox="0 0 1216 2" fill="none">
                    <path d="M0 1H1216" stroke="#D1D5DB" />
                </svg>

										<div
											class="flex max-lg:flex-col items-center gap-8 lg:gap-24 px-3 md:px-11">
											<div class="grid grid-cols-4 w-full">
												<div class="col-span-4 sm:col-span-1">

													<img src="data:image/png;base64,${orderdata.food.base64}"
														alt="${orderdata.food.foodname}"
														class="max-sm:mx-auto object-cover">
												</div>
												<div
													class="col-span-4 sm:col-span-3 max-sm:mt-4 sm:pl-8 flex flex-col justify-center max-sm:items-center">
													<h6
														class="font-manrope font-semibold text-2xl leading-9 text-black mb-3 whitespace-nowrap">
														${orderdata.food.foodname}</h6>
													<p
														class="font-normal text-lg leading-8 text-gray-500 mb-8 whitespace-nowrap">By:
														Online Food Ordering</p>
													<div
														class="flex items-center max-sm:flex-col gap-x-10 gap-y-3">
														<span
															class="font-normal text-lg leading-8 text-gray-500 whitespace-nowrap">Qty:
															${orderdata.quantity}</span> <span
															class="font-semibold text-xl leading-8 text-black whitespace-nowrap">
															Price: <span>&#x20B9;</span> ${orderdata.price}
														</span>
													</div>
												</div>
											</div>
											<div
												class="flex items-center justify-around w-full  sm:pl-28 lg:pl-0">
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
												<div
													class="flex flex-col justify-center items-start max-sm:items-center">
													<p
														class="font-normal text-lg text-gray-500 leading-8 mb-2 text-left whitespace-nowrap">
														Ordered By : ${item.customer.firstname}</p>
													<p
														class="font-semibold text-lg leading-8 text-black text-left whitespace-nowrap">
														Delivery Address : ${item.deliveryaddress}</p>
												</div>
											</div>

										</div>
									</c:forEach>
								</c:when>
								
							</c:choose>
							<svg class="my-9 w-full" xmlns="http://www.w3.org/2000/svg"
								width="1216" height="2" viewBox="0 0 1216 2" fill="none">
                    <path d="M0 1H1216" stroke="#D1D5DB" />
                </svg>
							<svg class="mt-9 w-full" xmlns="http://www.w3.org/2000/svg"
								width="1216" height="2" viewBox="0 0 1216 2" fill="none">
                    <path d="M0 1H1216" stroke="#D1D5DB" />
                </svg>

							<div
								class="px-3 md:px-11 flex items-center justify-between max-sm:flex-col-reverse">
								<div class="flex max-sm:flex-col-reverse items-center">
									<button
										class="flex items-center gap-3 py-10 pr-8 sm:border-r border-gray-300 font-normal text-xl leading-8 text-gray-500 group transition-all duration-500 hover:text-indigo-600">
										<svg width="40" height="41" viewBox="0 0 40 41" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                <path
												class="stroke-gray-600 transition-all duration-500 group-hover:stroke-indigo-600"
												d="M14.0261 14.7259L25.5755 26.2753M14.0261 26.2753L25.5755 14.7259"
												stroke="" stroke-width="1.8" stroke-linecap="round"
												stroke-linejoin="round" />
                            </svg>
										<a href="cancel?orderid=${item.orderid}"
											onclick="return confirm('Do You Want To Cancel')">cancel
											order </a>
									</button>
									<p class="font-normal text-xl leading-8 text-gray-500 sm:pl-8">
									Payment Status : ${item.paymentstatus}</p>
								</div>
								<p class="font-medium text-xl leading-8 text-black max-sm:py-4">
									<span class="text-gray-500">Total Price: </span> &nbsp;<span>&#x20B9;</span>${item.finalprice}
								</p>
							</div>
						</div>
					</c:forEach>

				</c:when>
				<c:otherwise>
								<center>
								<h1 style="color: grey;">NO ORDER FOUND</h1>
								</center>
								</c:otherwise>

			</c:choose>
		</div>
	</section>

</body>
</html>