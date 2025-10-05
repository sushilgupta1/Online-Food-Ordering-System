<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>Food Items</title>
    <!-- Tailwind CSS CDN -->
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
         
       
        /* Hover color update */
        .box:hover {
            background-color: #ff983d; /* Deep Indigo */
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

        .food-card {
            margin-top: 1rem; /* Margin for top spacing */
        }

        .food-image {
            width: 60px; /* Set width for the image */
            height: 60px; /* Set height for the image */
            margin-right: 1rem; /* Space between image and text */
        }
        .food-card {
    margin-top: 1rem; /* Margin for top spacing */
    transition: transform 0.3s ease-in-out; /* Smooth scaling effect */
}
        .food-card:hover {
	scale:1.008;
}
 .btn-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px; /* Space below the button group */
        }

        .btn-container .btn {
            margin: 0; /* Remove default margin */
        }

        .action-icons {
            display: flex;
            justify-content: space-between;
            width: 80px;
            margin: 0 auto;
        }

        .action-icons a {
            display: inline-block;
            cursor: pointer;
            transition: transform 0.2s, opacity 0.2s;
            text-decoration: none;
        }

        .action-icons img {
            vertical-align: middle;
            transition: transform 0.2s;
        }

        .action-icons a:hover img {
            transform: scale(0.85);
        }

        .action-icons a.edit:hover {
            opacity: 0.8;
        }

        .action-icons a.delete:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body class="bg-cover bg-gray-900 text-white min-h-screen flex flex-col justify-center items-center">

    <div class="overlay"></div>

    <!-- Header -->
    <nav class="navbar fixed top-0 left-0 w-full z-50">
        <div class="container mx-auto flex items-center justify-between px-4 sm:px-6 lg:px-8">
            <div class="nav-logo">
                <img alt="logo" src="/photo/logo.webp">
                <h1 class="text-2xl font-bold tracking-wide text-white">Online Food Order</h1>
            </div>
            <!-- Navigation Links -->
           <div class="hidden md:flex space-x-5">
            
                <a href="adminhome" class="nav-link ">Dashboard</a>
                <a href="allcustomers" class="nav-link">See All Customers</a>
                <a href="allorders" class="nav-link">See All Orders</a>
                <a href="addfooditem" class="nav-link">Add Food Item</a>
                <a href="manage" class="nav-link">Manage Items</a>
            </div>
            <div class="total-selling mt-2 md:mt-0">
                Total Selling:<span style="color: green;"> &#x20B9;${admin.totalselling}</span>
            </div>
        </div>
    </nav>
   

    <h2 class="text-center text-white mt-5 text-shadow" style="margin-top: 100px;"></h2>
    <c:choose>
        <c:when test="${!empty foodItems}">
            <h1 class="text-center text-white mt-5 text-shadow" style="font-size: xx-large;font-weight: bold;">Food Item List</h1>
            <div class="w-full max-w-7xl mx-auto px-4 mt-6">
                <div class="space-y-6">
                    <c:forEach var="food" items="${foodItems}">
                        <div class="food-card bg-gray-800 p-4 rounded-lg shadow-lg flex items-center flex-col sm:flex-row">
                            <img src="data:image/png;base64,${food.base64}" alt="${food.foodname}" class="food-image rounded" /> <!-- Image placeholder -->
                            <div class="flex-grow text-center sm:text-left mt-4 sm:mt-0">
                                <h3 class="text-xl font-bold text-green-400">${food.foodname}</h3>
                                <p class="text-gray-400">Item ID: ${food.foodid}</p>
                            </div>
                            <div class="flex items-center space-x-4 ">
                                <p class="price-tag text-gray-300">Price: &#x20B9;${food.price}</p>
                                <p class="discount-tag">Discount: ${food.discount}%</p>
                                <p class="discounted-price">Final Price: &#x20B9;${food.price - food.price * (food.discount / 100.0)}</p>
                                <div class="mt-4 flex space-x-2 sm:mt-0">
                                    <a href="edit?foodid=${food.foodid}" class="text-blue-500 hover:text-blue-300" title="Edit">
                                        <img alt="Edit Food" src="/photo/edit.png" height="25" width="25">
                                    </a>
                                    <a href="delete?foodid=${food.foodid}" class="text-red-500 hover:text-red-300" title="Delete" onclick="return confirm('Do You Want To Delete')">
                                        <img alt="Delete Food" src="/photo/delete.png" height="25" width="25">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <p class="text-shadow text-center mt-5">No Food data available.</p>
        </c:otherwise>
    </c:choose>
    <h1 style="margin-top: 20px;"></h1>
</body>
</html>
