<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>Food Items</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        * {
            font-family: 'Nunito', sans-serif;
        }
        .bg-cover {
            background-image: url('/photo/foodbanner.jpg'); /* Example background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.7); /* Dark overlay */
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 1;
        }
        .content {
            position: relative;
            z-index: 2;
        }
        .food-card {
            transition: transform 0.3s ease-in-out;
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 15px;
            padding: 10px;
        }
        .food-card:hover {
            transform: scale(1.05);
        }
        .price-tag {
            background-color: #FFC107;
            color: #ff0000;
            padding: 4px 12px;
            border-radius: 20px;
            font-weight: bold;
            display: inline-block;
            margin-top: 4px;
            text-decoration: line-through;
        }
        .discounted-price {
            color: #4CAF50;
            font-weight: bold;
            font-size: 1.2em;
            display: inline-block;
            margin-left: 8px;
        }
        .discount-tag {
            background-color: #FF5722;
            color: #fff;
            padding: 4px 12px;
            border-radius: 20px;
            font-weight: bold;
            display: inline-block;
            margin-left: 8px;
            font-size: 0.9em;
        }
        .food-name {
            color: #8BC34A;
        }
        /* Enhanced Navbar Styling */
        .navbar {
            background-color: #FF6D00;
            padding: 1rem 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
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
            font-weight: bold;
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
    </style>
</head>
<body class="bg-cover bg-gray-900 text-white min-h-screen flex flex-col justify-center items-center">
    
    <!-- Dark overlay to enhance text readability over the background -->
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

    <!-- Main Content -->
    <section class="content relative z-10 py-24 pt-20">
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <h1 class="font-manrope font-bold text-5xl text-center text-purple-400 mb-8">Available Products</h1>
            <c:choose>
                <c:when test="${!empty foodItems}">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <c:forEach var="food" items="${foodItems}">
                            <a href="javascript:;" class="food-card max-w-[384px] mx-auto shadow-lg hover:shadow-2xl">
                                <div class="w-full max-w-sm h-72 overflow-hidden rounded-2xl">
                                    <img src="data:image/png;base64,${food.base64}" alt="${food.foodname}" class="w-full h-full object-cover object-center">
                                </div>
                                <div class="mt-5 flex flex-col items-start">
                                    <h6 class="food-name font-medium text-xl leading-8 mb-2">${food.foodname}</h6>
                                    <p class="text-gray-300 mb-2">${food.description}</p>
                                    <div>
                                        <span class="price-tag"><span>&#x20B9;</span>${food.price}</span>
                                        <c:if test="${food.discount > 0}">
                                            <span class="discount-tag">${food.discount}% OFF</span>
                                            <span class="discounted-price">
                                                <span>&#x20B9;</span><c:out value="${food.price - (food.price * food.discount / 100)}"/>
                                            </span>
                                        </c:if>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <h2 class="text-center text-gray-300">No Product Found</h2>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</body>
</html>
