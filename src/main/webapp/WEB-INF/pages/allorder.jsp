<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
<title>All Order</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

 <style>
       *
    {
    	font-family: 'Nunito', sans-serif;
    }
        /* Background settings */
        .bg-cover {
            background-image: url('/photo/foodbanner.jpg'); /* Path to your background image */
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
            z-index: -10;
        }
        .content {
            position: relative;
            z-index: 2;
        }
        
        .navbar {
            background-color: #FF6D00;
            padding: 1rem 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            font-family: 'Nunito', sans-serif;
            font-weight: bold;
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
            /* font-weight: bold; */
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
            font-size: 1.1rem;
        }
         .total-selling {
            color: white;
            font-weight: bold;
            font-size: 1rem;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }

        .text-shadow {
            text-shadow: 1px 1px 2px black;
        }

    </style>
</head>

<body class="bg-cover bg-gray-900 text-white min-h-screen flex flex-col justify-center items-center">

    <div class="overlay"></div>

    <!-- Header -->
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

    	<section class="content py-24 relative " >
		<div class="w-full max-w-7xl mx-auto px-4 md:px-8" >
			<h2
				class="font-manrope font-extrabold text-3xl lead-10 text-white mb-9">Order
				History</h2>

			<%-- <h4 align="center" style="color: red;">${error}</h4> --%>
			<c:choose>
				<c:when test="${!empty order}">
					<c:forEach var="item" items="${order}">

						<div class="mt-7 border border-gray-300 pt-9 box  rounded-3xl bg-gray-700 grid  cursor-pointer transition-all duration-500">
							<div
								class="flex max-md:flex-col items-center justify-between px-3 md:px-11">
								<div class="data">
									<p class="font-medium text-lg leading-8 text-white whitespace-nowrap">Order
										: #${item.orderid}</p>
								</div>
								<div >
								<p class="font-medium text-lg leading-8 text-white mt-3 whitespace-nowrap">Order
										Date :
										${item.orderDate.dayOfMonth}-${item.orderDate.month}-${item.orderDate.year}</p></div>
								<div class="flex items-center gap-3 max-md:mt-5">
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
														class="font-manrope font-semibold text-2xl leading-9 text-white mb-3 whitespace-nowrap">
														${orderdata.food.foodname}</h6>
													<p
														class="font-normal text-lg leading-8 text-gray-300 mb-8 whitespace-nowrap">By:
														Online Food Ordering</p>
													<div
														class="flex items-center max-sm:flex-col gap-x-10 gap-y-3">
														<span
															class="font-normal text-lg leading-8 text-gray-300 whitespace-nowrap">Qty:
															${orderdata.quantity}</span> <span
															class="font-semibold text-xl leading-8 text-gray-300 whitespace-nowrap">
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
														class="font-normal text-lg text-gray-300 leading-8 mb-2 text-left whitespace-nowrap">
														Status</p>
													<p
														class="font-semibold text-lg leading-8 text-left whitespace-nowrap"
														style="color: ${item.status == 'Cancelled'||item.status == 'cancelled' ? 'red' : 'green'};">
														${item.status}</p>
												</div>
												<div
													class="flex flex-col justify-center items-start max-sm:items-center">
													<p
														class="font-normal text-lg text-gray-300 leading-8 mb-2 text-left whitespace-nowrap " >
														Ordered By : ${item.customer.firstname}</p>
													<p
														class="font-semibold text-lg leading-8 text-white text-left whitespace-nowrap">
														Delivery Address : ${item.deliveryaddress}</p>
												</div>
											</div>

										</div>
									</c:forEach>
								</c:when>
							</c:choose>
							<svg class="my-5 w-full" xmlns="http://www.w3.org/2000/svg"
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
									
									<p class="font-normal text-xl leading-8 text-gray-500 sm:pl-8" style="color: white; ">Payment Status : ${item.paymentstatus}</p>
								</div>
								<p class="font-medium text-xl leading-8 text-black max-sm:py-4">
									<span class="text-gray-300">Total Price:  &nbsp;<span>&#x20B9;</span>${item.finalprice}</span>
								</p>
							</div>
						</div>
					</c:forEach>

				</c:when>


			</c:choose>
		</div>
	</section>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>