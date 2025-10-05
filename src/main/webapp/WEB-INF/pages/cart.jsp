<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Your Cart</title>
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
/* Cart Page Styling */
.container {
	margin-top: 100px;
}

h2 {
	font-weight: bold;
	color: #343a40;
}

.cart-item {
	border-bottom: 1px solid #ddd;
	padding: 20px 0;
	position: relative;
}

.cart-item img {
	width: 120px;
	height: auto;
	border-radius: 8px;
}

.cart-item-details h5 {
	font-weight: 600;
	margin-bottom: 5px;
}

.cart-item-quantity {
	display: flex;
	align-items: center;
}

.cart-item-quantity .btn {
	font-size: 0.9rem;
}

.cart-item-price .food-price {
	font-size: 1.2em;
	font-weight: bolder;
	color: #2c3e50;
}

.cart-item-price .food-discount {
	font-size: 0.9rem;
	color: red;
	text-decoration: line-through;
	margin-left: 10px;
}

.cart-item-price .discount-percent {
	font-size: 0.9rem;
	color: green;
	margin-left: 5px;
}

.btn-close {
	background-color: #ff4d4d;
	background-image: linear-gradient(145deg, #ff6666, #ff1a1a);
	border-radius: 100%;
	color: white;
	font-size: 0.8rem;
	width: 15px;
	height: 15px;
	text-align: center;
	position: absolute;
	top: 0px;
	right: 2px;
	cursor: pointer;
	border: none;
	transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s;
}

.btn-close:hover {
	background-color: #ff1a1a;
	background-image: none;
	transform: scale(1.1);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

.cart-summary {
	background-color: #f9f9f9;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.cart-summary h4 {
	font-weight: bold;
	color: #2c3e50;
}

.cart-summary .summary-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.checkout-btn {
	background-color: #ffd700;
	border: none;
	width: 100%;
	padding: 15px;
	font-size: 1.1em;
	color: white;
	font-weight: bold;
	border-radius: 10px;
	transition: transform 0.2s ease, background-color 0.2s ease;
	/* Add transition for smooth effect */
}

.checkout-btn:hover {
	transform: scale(0.90); /* Shrinks the button to 95% of its size */
	background-color: #ffd700; /* Keeps the same color */
}

/* Adjust the counter-value */
.counter-value {
	padding: 0 10px;
	font-weight: bold;
	font-size: 1rem;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.cart-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.cart-item img {
		margin-bottom: 15px;
	}
}
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        function updateSubtotal() {
            let subtotal = 0;
            let discount = 0;

            document.querySelectorAll('.cart-item').forEach(item => {
                const priceElement = item.querySelector('.food-price');
                const qty = parseInt(item.querySelector('.counter-value').textContent);
                const discountElement = item.querySelector('.discount-percent');

                const originalPrice = parseFloat(priceElement.getAttribute('data-original-price'));
                if (isNaN(originalPrice)) {
                    console.error('Invalid original price:', originalPrice);
                    return;
                }

                const discountPercentText = discountElement ? discountElement.innerText : '0';
                const discountPercent = parseFloat(discountPercentText.replace(/[^\d.-]/g, ''));
                if (isNaN(discountPercent)) {
                    console.error('Invalid discount percent:', discountPercent);
                    return;
                }

                const discountedPrice = originalPrice * (1 - discountPercent / 100);
                subtotal += originalPrice * qty;
                discount += (originalPrice - discountedPrice) * qty;
            });

            const deliveryCharge = (2 / 100) * subtotal;
            const total = subtotal - discount + deliveryCharge;

            document.getElementById('subtotal').innerText = subtotal.toFixed(2);
            document.getElementById('discount').innerText = discount.toFixed(2);
            document.getElementById('delivery-charge').innerText = deliveryCharge.toFixed(2);
            document.getElementById('total').innerText = total.toFixed(2);
        }

        document.querySelectorAll('.increment-btn').forEach(button => {
            button.addEventListener('click', function () {
                const counterElement = this.previousElementSibling;
                let counter = parseInt(counterElement.textContent);
                counter++;
                counterElement.textContent = counter;
                updateSubtotal();
            });
        });

        document.querySelectorAll('.decrement-btn').forEach(button => {
            button.addEventListener('click', function () {
                const counterElement = this.nextElementSibling;
                let counter = parseInt(counterElement.textContent);
                if (counter > 1) {
                    counter--;
                    counterElement.textContent = counter;
                    updateSubtotal();
                }
            });
        });

        updateSubtotal();
    });
</script>
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

	<!-- Cart Section -->
	<div class="container">
		<h2>Your Basket</h2>
		<div class="row">
			<!-- Left Section: Cart Items -->
			<div class="col-md-8 col-12">
				<c:choose>
					<c:when test="${!empty cartdata}">
						<c:forEach var="cartitem" items="${cartdata}">
							<div
								class="cart-item d-flex justify-content-between align-items-center mb-3">
								<img src="data:image/png;base64,${cartitem.copyFood.base64}"
									alt="${cartitem.copyFood.foodname}" class="img-fluid rounded">
								<div class="cart-item-details flex-grow-1 ms-3">
									<h5>${cartitem.copyFood.foodname}</h5>
									<span>Click & Collect | Home Delivery</span>
								</div>
								<div class="cart-item-quantity d-flex align-items-center">
									<form action="updatecart" method="post"
										class="d-flex align-items-center">
										<input type="hidden" name="cartid" value="${cartitem.cartid}">
										<input type="hidden" name="qty" value="${cartitem.qty}">
										<button type="submit"
											class="decrement-btn btn btn-outline-secondary btn-sm mx-2"
											name="update" value="-">-</button>
										<span class="counter-value">${cartitem.qty}</span>
										<button type="submit"
											class="increment-btn btn btn-outline-secondary btn-sm mx-2"
											name="update" value="+">+</button>
									</form>
								</div>
								<div class="cart-item-price">
									<p class="food-price"
										data-original-price="${cartitem.copyFood.price}">
										<span>&#x20B9;</span>
										<fmt:formatNumber
											value="${cartitem.qty * cartitem.copyFood.price * (1 - cartitem.copyFood.discount / 100)}"
											maxFractionDigits="2" minFractionDigits="2" />
										<span class="food-discount"><fmt:formatNumber
												value="${cartitem.qty * cartitem.copyFood.price}"
												maxFractionDigits="2" minFractionDigits="2" /></span> <span
											class="discount-percent">${cartitem.copyFood.discount}%
											off</span>
									</p>
								</div>
								<a href="remove?cartid=${cartitem.cartid}"><button
										class="btn-close" aria-label="Close">&times;</button></a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
					
						<h2 style="color: gray;">YOUR CART IS EMPTY</h2>
						
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Right Section: Summary -->
			<%
			long count = (long) request.getAttribute("count");
			%>

			<c:choose>
				<c:when test="${count==0}">
				</c:when>
				<c:otherwise>

					<div class="col-md-4 col-12">
						<div class="cart-summary p-4 shadow-sm rounded">
							<h4>Home Delivery</h4>
							<hr>
							<div class="summary-item"
								style="display: flex; justify-content: space-between; align-items: center;">
								<span>Subtotal:</span> <span>&#8377;<span id="subtotal">
										0.00</span></span>
							</div>
							<div class="summary-item"
								style="display: flex; justify-content: space-between; align-items: center;">
								<span>Discount:</span> <span>&#8377;<span id="discount">
										0.00</span></span>
							</div>

							<div class="summary-item"
								style="display: flex; justify-content: space-between; align-items: center;">
								<span>Delivery Charge (2%):</span> <span> <span>&#8377;</span><span
									id="delivery-charge"> 0.00</span>
								</span>
							</div>

							<hr>
							<div class="summary-item"
								style="display: flex; justify-content: space-between; align-items: center;">
								<span>Total:</span> <span><span>&#8377;</span><span
									id="total"><strong>0.00</strong></span></span>
							</div>

							<a href="checkout"><button class="btn checkout-btn mt-3">Checkout</button></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

</body>
</html>
