<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>Add Product</title>
    <!-- Tailwind CSS -->
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

</style>
</head>

<body class="bg-cover  text-white flex  justify-center items-center">
    
    <!-- Dark overlay to enhance text readability over the background -->
    <div class="overlay"></div>
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
    
    <!-- Form Container with margin-top to position it below the navbar -->
    <div class="mt-32 max-w-lg bg-gray-800 bg-opacity-60 p-8 rounded-xl shadow-xl transform transition duration-300">

        <!-- Display Message -->
        <p class="text-center text-yellow-400 font-semibold mb-6 text-lg">${msg}</p>

        <!-- Form Title -->
        <h2 class="text-4xl font-extrabold text-yellow-400 text-center mb-8">Add Food Item</h2>

        <!-- Add Food Item Form -->
        <form action="add" enctype="multipart/form-data" method="post" class="space-y-6">

            <!-- Food Name -->
            <input type="text" name="foodname" placeholder="Food Name" required
                class="w-full px-6 py-3 rounded-lg bg-gray-700 border border-gray-600 text-gray-200 placeholder-gray-400 focus:outline-none focus:ring-4 focus:ring-yellow-500 transition duration-200 ease-in-out">

            <!-- Description -->
            <input type="text" name="description" placeholder="Description" required
                class="w-full px-6 py-3 rounded-lg bg-gray-700 border border-gray-600 text-gray-200 placeholder-gray-400 focus:outline-none focus:ring-4 focus:ring-yellow-500 transition duration-200 ease-in-out">

            <!-- Discount -->
            <input type="text" name="discount" placeholder="Discount (%)" required
                class="w-full px-6 py-3 rounded-lg bg-gray-700 border border-gray-600 text-gray-200 placeholder-gray-400 focus:outline-none focus:ring-4 focus:ring-yellow-500 transition duration-200 ease-in-out">

            <!-- Price -->
            <input type="text" name="price" placeholder="Price (in rupees)" required
                class="w-full px-6 py-3 rounded-lg bg-gray-700 border border-gray-600 text-gray-200 placeholder-gray-400 focus:outline-none focus:ring-4 focus:ring-yellow-500 transition duration-200 ease-in-out">

            <!-- Category -->
            <input type="text" name="category" placeholder="Category" required
                class="w-full px-6 py-3 rounded-lg bg-gray-700 border border-gray-600 text-gray-200 placeholder-gray-400 focus:outline-none focus:ring-4 focus:ring-yellow-500 transition duration-200 ease-in-out">

            <!-- Food Image -->
            <input type="file" name="foodimage"
                class="w-full px-6 py-3 rounded-lg bg-gray-700 text-gray-300 border border-gray-600 cursor-pointer focus:outline-none focus:ring-4 focus:ring-yellow-500">

            <!-- Submit Button -->
            <button type="submit"
                class="w-full py-3 bg-yellow-500 text-gray-900 font-semibold rounded-full hover:bg-yellow-400 focus:ring-4 focus:ring-yellow-300 focus:outline-none transition duration-300 ease-in-out shadow-lg transform hover:scale-105">Add Item</button>
        </form>
    </div>
    
</body>
</html>
