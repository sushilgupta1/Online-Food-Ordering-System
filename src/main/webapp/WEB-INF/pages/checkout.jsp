<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout Page</title>
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
.checkout-container {
	margin-top: 100px;
}

.card {
	margin-bottom: 1.5rem;
}

.checkout-summary {
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 5px;
}

.checkout-summary h5 {
	font-weight: bold;
}

.checkout-summary .total {
	font-size: 1.2em;
	font-weight: bold;
}

.btn-checkout {
	background-color: #333333; /* Rich dark grey */
	border: none;
	width: 100%;
	padding: 15px;
	font-size: 1.1em;
	color: white;
	font-weight: bold;
	border-radius: 10px;
	transition: transform 0.2s ease, background-color 0.3s ease;
}

.btn-checkout:hover {
background-color: #444444; /* Slightly lighter grey for hover */
	transform: scale(0.97); /* Slight shrink effect */
}

.form-check-label {
	margin-left: 5px;
}

.error-message {
	display: none;
	padding: 10px;
	margin-top: 10px;
	color: white;
	background-color: red;
	border-radius: 5px;
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

@media ( max-width : 576px) {
	.checkout-items, .checkout-summary {
		width: 100%;
		margin-bottom: 20px;
	}
}
.truck-button {
        --color: #fff;
        --background: #2B3044;
        --tick: #16BF78;
        --base: #0D0F18;
        --wheel: #2B3044;
        --wheel-inner: #646B8C;
        --wheel-dot: #fff;
        --back: #6D58FF;
        --back-inner: #362A89;
        --back-inner-shadow: #2D246B;
        --front: #A6ACCD;
        --front-shadow: #535A79;
        --front-light: #FFF8B1;
        --window: #2B3044;
        --window-shadow: #404660;
        --street: #646B8C;
        --street-fill: #404660;
        --box: #DCB97A;
        --box-shadow: #B89B66;
        padding: 12px 0;
        width: 172px;
        cursor: pointer;
        text-align: center;
        position: relative;
        border: none;
        outline: none;
        color: var(--color);
        background: var(--background);
        border-radius: var(--br, 5px);
        
        -webkit-tap-highlight-color: transparent;
        transform-style: preserve-3d;
        transform: rotateX(var(--rx, 0deg)) translateZ(0);
        transition: transform .5s, border-radius .3s linear var(--br-d, 0s);
        &:before,
        &:after {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 6px;
            display: block;
            background: var(--b, var(--street));
            transform-origin: 0 100%;
            transform: rotateX(90deg) scaleX(var(--sy, 1));
        }
        &:after {
            --sy: var(--progress, 0);
            --b: var(--street-fill);
        }
        .default,
        .success {
            display: block;
            font-weight: 500;
            font-size: 14px;
            line-height: 24px;
            opacity: var(--o, 1);
            transition: opacity .3s;
        }
        .success {
            --o: 0;
            position: absolute;
            top: 12px;
            left: 0;
            right: 0;
            svg {
                width: 12px;
                height: 10px;
                display: inline-block;
                vertical-align: top;
                fill: none;
                margin: 7px 0 0 4px;
                stroke: var(--tick);
                stroke-width: 2;
                stroke-linecap: round;
                stroke-linejoin: round;
                stroke-dasharray: 16px;
                stroke-dashoffset: var(--offset, 16px);
                transition: stroke-dashoffset .4s ease .45s;
            }
        }
        .truck {
            position: absolute;
            width: 72px;
            height: 28px;
            transform: rotateX(90deg) translate3d(var(--truck-x, 4px), calc(var(--truck-y-n, -26) * 1px), 12px);
            &:before,
            &:after {
                content: '';
                position: absolute;
                bottom: -6px;
                left: var(--l, 18px);
                width: 10px;
                height: 10px;
                border-radius: 50%;
                z-index: 2;
                box-shadow: inset 0 0 0 2px var(--wheel), inset 0 0 0 4px var(--wheel-inner);
                background: var(--wheel-dot);
                transform: translateY(calc(var(--truck-y) * -1px)) translateZ(0);
            }
            &:after {
                --l: 54px;
            }
            .wheel,
            .wheel:before {
                position: absolute;
                bottom: var(--b, -6px);
                left: var(--l, 6px);
                width: 10px;
                height: 10px;
                border-radius: 50%;
                background: var(--wheel);
                transform: translateZ(0);
            }
            .wheel {
                transform: translateY(calc(var(--truck-y) * -1px)) translateZ(0);
            }
            .wheel:before {
                --l: 35px;
                --b: 0;
                content: '';
            }
            .front,
            .back,
            .box {
                position: absolute;
            }
            .back {
                left: 0;
                bottom: 0;
                z-index: 1;
                width: 47px;
                height: 28px;
                border-radius: 1px 1px 0 0;
                background: linear-gradient(68deg, var(--back-inner) 0%, var(--back-inner) 22%, var(--back-inner-shadow) 22.1%, var(--back-inner-shadow) 100%);
                &:before,
                &:after {
                    content: '';
                    position: absolute;
                }
                &:before {
                    left: 11px;
                    top: 0;
                    right: 0;
                    bottom: 0;
                    z-index: 2;
                    border-radius: 0 1px 0 0;
                    background: var(--back);
                }
                &:after {
                    border-radius: 1px;
                    width: 73px;
                    height: 2px;
                    left: -1px;
                    bottom: -2px;
                    background: var(--base);
                }
            }
            .front {
                left: 47px;
                bottom: -1px;
                height: 22px;
                width: 24px;
                -webkit-clip-path: polygon(55% 0, 72% 44%, 100% 58%, 100% 100%, 0 100%, 0 0);
                clip-path: polygon(55% 0, 72% 44%, 100% 58%, 100% 100%, 0 100%, 0 0);
                background: linear-gradient(84deg, var(--front-shadow) 0%, var(--front-shadow) 10%, var(--front) 12%, var(--front) 100%);
                &:before,
                &:after {
                    content: '';
                    position: absolute;
                }
                &:before {
                    width: 7px;
                    height: 8px;
                    background: #fff;
                    left: 7px;
                    top: 2px;
                    -webkit-clip-path: polygon(0 0, 60% 0%, 100% 100%, 0% 100%);
                    clip-path: polygon(0 0, 60% 0%, 100% 100%, 0% 100%);
                    background: linear-gradient(59deg, var(--window) 0%, var(--window) 57%, var(--window-shadow) 55%, var(--window-shadow) 100%)
                }
                &:after {
                    width: 3px;
                    height: 2px;
                    right: 0;
                    bottom: 3px;
                    background: var(--front-light);
                }
            }
            .box {
                width: 13px;
                height: 13px;
                right: 56px;
                bottom: 0;
                z-index: 1;
                border-radius: 1px;
                overflow: hidden;
                transform: translate(calc(var(--box-x, -24) * 1px), calc(var(--box-y, -6) * 1px)) scale(var(--box-s, .5));
                opacity: var(--box-o, 0);
                background: linear-gradient(68deg, var(--box) 0%, var(--box) 50%, var(--box-shadow) 50.2%, var(--box-shadow) 100%);
                background-size: 250% 100%;
                background-position-x: calc(var(--bx, 0) * 1%);
                &:before,
                &:after {
                    content: '';
                    position: absolute;
                }
                &:before {
                    content: '';
                    background: rgba(white, .2);
                    left: 0;
                    right: 0;
                    top: 6px;
                    height: 1px;
                }
                &:after {
                    width: 6px;
                    left: 100%;
                    top: 0;
                    bottom: 0;
                    background: var(--back);
                    transform: translateX(calc(var(--hx, 0) * 1px));
                }
            }
        }
        &.animation {
            --rx: -90deg;
            --br: 0;
            .default {
                --o: 0;
            }
            &.done {
                --rx: 0deg;
                --br: 5px;
                --br-d: .2s;
                .success {
                    --o: 1;
                    --offset: 0;
                }
            }
        }
    }
    
    
    html {
        box-sizing: border-box;
        -webkit-font-smoothing: antialiased;
    }
    
    * {
        box-sizing: inherit;
        &:before,
        &:after {
            box-sizing: inherit;
        }
    }
    
    body {
        min-height: 100vh;
        display: flex;
        font-family: 'Inter UI', 'Inter', Arial;
        justify-content: center;
        align-items: center;
        background: #ECEFFC;
        .dribbble {
            position: fixed;
            display: block;
            right: 20px;
            bottom: 20px;
            img {
                display: block;
                height: 28px;
            }
        }
       
        }
    }
    .a{
    	font-weight: bolder;
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
                
                
                
                document.getElementById('hiddenSubtotal').value = subtotal.toFixed(2);
                document.getElementById('hiddenDiscount').value = discount.toFixed(2);
                document.getElementById('hiddenDelivery').value = deliveryCharge.toFixed(2);
                document.getElementById('hiddenFinalPrice').value = total.toFixed(2);
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

        function showError(message) {
            const errorBox = document.getElementById('error-message');
            errorBox.textContent = message;
            errorBox.style.display = 'block';
            setTimeout(() => {
                errorBox.style.display = 'none';
            }, 3000);
        }

        function handlePaymentModeChange() {
            const paymentCard = document.getElementById('paymentCard');
            const paymentUPI = document.getElementById('paymentUPI');

            if (paymentCard.checked || paymentUPI.checked) {
                showError("This payment option is currently not available.");
                document.getElementById('paymentCOD').checked = true;
            }
        }
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
				<li class="nav-item"><a class="nav-link"  href="home" >Home</a></li>
				<!-- Home link added here -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle a" href="#"
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
				<li class="nav-item"><a class="nav-link a" href="order">Orders</a></li>
				<li class="nav-item"><a class="nav-link a" href="aboutus">About
						Us</a></li>
			</ul>
			<form class="d-flex ms-auto" action="search">
				<input class="form-control me-2" type="search"
					placeholder="Search Food" aria-label="Search" name="value">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
			<ul class="navbar-nav ms-auto">
				<li class="nav-item position-relative"><a
					class="nav-link d-flex align-items-center a" href="cart"> <img
						src="photo/cart.webp" alt="Cart"
						style="width: 24px; height: 24px; margin-right: 5px; margin-bottom: -3px">
						<!-- Adjust margin-right for spacing --> Cart <span
						class="badge bg-danger position-absolute"
						style="top: 2px; right: 60px; font-size: 0.7rem;">${count}</span>
				</a></li>


				<li class="nav-item">Welcome, ${name}</li>
				<li class="nav-item"><a class="nav-link a" href="logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Checkout Content -->
	<div class="container checkout-container">
		<div class="row">
			<!-- Items Section -->
			<div class="col-lg-8 col-md-8 col-sm-12 checkout-items">
				<h4>Item(s)</h4>

				<c:choose>
					<c:when test="${!empty fooddata}">
						<c:forEach var="item" items="${fooddata}">
							<div class="card cart-item">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div class="d-flex">
										<img src="data:image/png;base64,${item.copyFood.base64}"
											alt="${item.copyFood.foodname}" class="img-fluid"
											style="width: 60px; height: 80px; margin-right: 20px;">
										<div>
											<h6>${item.copyFood.foodname}</h6>
											<p>
												Qty : <span class="counter-value">${item.qty}</span>
											</p>
										</div>
									</div>
									<div class="text-end">
										<p class="food-price"
											data-original-price="${item.copyFood.price}">
											<span>&#x20B9;</span> ${item.qty * item.copyFood.price - item.qty * item.copyFood.price * item.copyFood.discount / 100}
											<span class="food-discount">${item.qty * item.copyFood.price}</span>
											<span class="discount-percent">${item.copyFood.discount}%
												off</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h1 style="color: gray;">No items in the cart.</h1>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Summary Section -->
			<%
			long count=(long)request.getAttribute("count");
			%>
			<c:choose>
			<c:when test="${count==0}">
			</c:when>
			<c:otherwise>
			<div class="col-lg-4 col-md-4 col-sm-12 checkout-summary">
			<frm:form modelAttribute="order" action="confirmorder" method="post" id="orderForm">
				<h5>Summary</h5>
				<hr>
				
					<div class="summary-item">
						
						<span>Subtotal:</span> <span>&#x20B9;</span><span id="subtotal">0.00</span>
					</div>
					
					<div class="summary-item">
						<span>Discount:</span> <span>&#x20B9;</span><span id="discount">0.00</span>
					</div>
					<div class="summary-item">
						<span>Delivery Charge (2%):</span><span>&#x20B9;</span> <span id="delivery-charge">0.00</span>
					</div>

					<div class="summary-item">
						<span>Total:</span> <span>&#x20B9;</span><span id="total"><strong>0.00</strong></span>
					</div>
					<hr>
					
					<!--  <input type="text" class="form-control mb-3" placeholder="Enter your coupon here">
                <button class="btn btn-primary btn-block mb-3">Apply Coupon</button>-->
							<%--  <frm:form modelAttribute="order" method="post"
								action="confirmorder" id="orderForm">--%>
								<h5>Delivery Address</h5>
								<frm:textarea path="deliveryaddress" class="form-control mb-3"
									placeholder="Enter your full address here" rows="4"
									required="required" id="deliveryAddress" oninput="checkInput()"></frm:textarea>

								<frm:hidden path="price" id="hiddenSubtotal" />
								<frm:hidden path="discount" id="hiddenDiscount" />
								<frm:hidden path="delivery" id="hiddenDelivery" />
								<frm:hidden path="finalprice" id="hiddenFinalPrice" />


								<h5>Payment Mode</h5>
								<div class="form-check mb-2">
									<input class="form-check-input" type="radio" name="paymentMode"
										id="paymentCOD" value="COD" checked
										onclick="handlePaymentModeChange()"> <label
										class="form-check-label" for="paymentCOD">Cash on
										Delivery</label>
								</div>
								<div class="form-check mb-2">
									<input class="form-check-input" type="radio" name="paymentMode"
										id="paymentCard" value="Card"
										onclick="handlePaymentModeChange()"> <label
										class="form-check-label" for="paymentCard">Credit/Debit
										Card</label>
								</div>
								<div class="form-check mb-2">
									<input class="form-check-input" type="radio" name="paymentMode"
										id="paymentUPI" value="UPI"
										onclick="handlePaymentModeChange()"> <label
										class="form-check-label" for="paymentUPI">UPI</label>
								</div>

								<div id="error-message" class="error-message"></div>
								<center>
									<button type ="button" class="truck-button"  id="completeOrderButton" >
										<span class="default">Complete Order</span> <span
											class="success"> Order Placed <svg viewbox="0 0 12 10">
                                <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
                            </svg>
										</span>
										<div class="truck">
											<div class="wheel"></div>
											<div class="back"></div>
											<div class="front"></div>
											<div class="box"></div>
										</div>
									</button>
								</center>


								<p class="text-center mt-2 text-muted">On the prepaid order,
									get an extra discount of 5%</p>
							</frm:form>
						
			</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>

    <script>
   
         document.querySelectorAll('.truck-button').forEach(button => {
    button.addEventListener('click', e => {

        e.preventDefault();
        
        let box = button.querySelector('.box'),
            truck = button.querySelector('.truck');
        
        if(!button.classList.contains('done')) {
            
            if(!button.classList.contains('animation')) {

                button.classList.add('animation');

                gsap.to(button, {
                    '--box-s': 1,
                    '--box-o': 1,
                    duration: .3,
                    delay: .5
                });

                gsap.to(box, {
                    x: 0,
                    duration: .4,
                    delay: .7
                });

                gsap.to(button, {
                    '--hx': -5,
                    '--bx': 50,
                    duration: .18,
                    delay: .92
                });

                gsap.to(box, {
                    y: 0,
                    duration: .1,
                    delay: 1.15
                });

                gsap.set(button, {
                    '--truck-y': 0,
                    '--truck-y-n': -26
                });

                gsap.to(button, {
                    '--truck-y': 1,
                    '--truck-y-n': -25,
                    duration: .2,
                    delay: 1.25,
                    onComplete() {
                        gsap.timeline({
                            onComplete() {
                                button.classList.add('done');
                            }
                        }).to(truck, {
                            x: 0,
                            duration: .4
                        }).to(truck, {
                            x: 40,
                            duration: 1
                        }).to(truck, {
                            x: 20,
                            duration: .6
                        }).to(truck, {
                            x: 96,
                            duration: .4
                        });
                        gsap.to(button, {
                            '--progress': 1,
                            duration: 2.4,
                            ease: "power2.in"
                        });
                    }
                });
                
            }
            
        } else {
            button.classList.remove('animation', 'done');
            gsap.set(truck, {
                x: 4
            });
            gsap.set(button, {
                '--progress': 0,
                '--hx': 0,
                '--bx': 0,
                '--box-s': .5,
                '--box-o': 0,
                '--truck-y': 0,
                '--truck-y-n': -26
            });
            gsap.set(box, {
                x: -24,
                y: -6
            });
        }
    });
});
    </script>
    <script>
    
    document.addEventListener('DOMContentLoaded', function() {
        const deliveryAddress = document.getElementById('deliveryAddress');
        const completeOrderButton = document.getElementById('completeOrderButton');

        // Initially disable the button
        completeOrderButton.disabled = true;
       
        // Check input on each keystroke
        deliveryAddress.addEventListener('input', function() {
        	 
            completeOrderButton.disabled = this.value.trim() === '';
        });

        // Handle the button click
        completeOrderButton.addEventListener('click', function(event) {
            if (!deliveryAddress.value.trim()) {
            	
                alert('Please enter your full address.'); // Alert the user
                console.log("Button clicked, checking address...");

                deliveryAddress.focus(); // Set focus back to the textarea
                return; // Prevent form submission if the address is blank
            }

            // If the address is valid, proceed to submit the form
            redirectAfterDelay();
        });

        function redirectAfterDelay() {
        	
            setTimeout(function() {
            	
                document.getElementById('orderForm').submit();
            }, 5500);
        }
    });
</script>


    
    <script>
        function checkInput() {
        	
            const input = document.getElementById('deliveryAddress').value;
            const button = document.getElementById('completeOrderButton');
            button.disabled = input.trim() === '';
            
        }
        function handleSubmit() {
        	
            const input = document.getElementById('deliveryAddress').value;
            if (input.trim() === '') {
                alert('Please enter your full address.'); // Alert the user
                document.getElementById('deliveryAddress').focus(); // Focus the address field
                return false; // Prevent form submission if any
            }
        }

    </script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" integrity="sha512-16esztaSRplJROstbIIdwX3N97V1+pZvV33ABoG1H2OyTttBxEGkTsoIVsiP1iaTtM8b3+hu2kB6pQ4Clr5yug==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>

