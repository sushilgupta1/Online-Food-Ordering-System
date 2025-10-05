<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>Add Food Item</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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
    </style>
</head>
<body class="bg-cover bg-gray-900 bg-opacity-60 text-white min-h-screen flex flex-col justify-center items-center">

    <!-- Dark overlay to enhance text readability over the background -->
    <div class="absolute inset-0 bg-gray-900 opacity-70"></div>

    <!-- Navbar -->
    <nav class="bg-orange-500 p-4 fixed top-0 left-0 w-full z-50">
        <div class="container mx-auto flex justify-between items-center">
            <div class="flex items-center">
                <img alt="logo" src="/photo/logo.webp" class="h-10 w-10 mr-2">
                <h1 class="text-2xl font-bold tracking-wide text-white">Online Food Order</h1>
            </div>
            <div class="hidden md:flex space-x-4"> <!-- Hide on small screens -->
                <a href="adminhome" class="nav-link">Dashboard</a>
                <a href="allcustomers" class="nav-link">See All Customers</a>
                <a href="allorders" class="nav-link">See All Orders</a>
                <a href="addfooditem" class="nav-link">Add Food Item</a>
                <a href="manage" class="nav-link">Manage Items</a>
            </div>
            <div class="total-selling hidden md:block"> <!-- Hide on small screens -->
                Total Selling: <span style="color: green;">&#x20B9;${admin.totalselling}</span>
            </div>
            <button id="navbar-toggle" class="md:hidden focus:outline-none"> <!-- Hamburger button -->
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path></svg>
            </button>
        </div>

        <!-- Dropdown for mobile -->
        <div id="navbar-menu" class="md:hidden hidden flex-col items-center bg-orange-600 p-4">
            <a href="adminhome" class="nav-link">Dashboard</a>
            <a href="allcustomers" class="nav-link">See All Customers</a>
            <a href="allorders" class="nav-link">See All Orders</a>
            <a href="addfooditem" class="nav-link">Add Food Item</a>
            <a href="manage" class="nav-link">Manage Items</a>
            <div class="total-selling">
                Total Selling: <span style="color: green;">&#x20B9;${admin.totalselling}</span>
            </div>
        </div>
    </nav>

    <div class="w-full max-w-md bg-gray-800 bg-opacity-80 p-6 rounded-lg shadow-lg mx-4 sm:mx-auto mt-20"> <!-- Adjusted margin for navbar -->
        <!-- Page Header -->
        <h2 class="text-3xl font-bold text-center text-yellow-400 mb-6">Add New Food Item</h2>

        <!-- Add Food Item Form -->
        <form action="addFoodItem" method="post">
            <!-- Food Name -->
            <div class="mb-4">
                <label for="foodName" class="block text-gray-300 font-semibold mb-1">Food Name</label>
                <input type="text" id="foodName" name="foodName" required class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-yellow-400">
            </div>

            <!-- Category -->
            <div class="mb-4">
                <label for="category" class="block text-gray-300 font-semibold mb-1">Category</label>
                <select id="category" name="category" required class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-yellow-400">
                    <option value="">Select Category</option>
                    <option value="Starter">Starter</option>
                    <option value="Main Course">Main Course</option>
                    <option value="Dessert">Dessert</option>
                    <option value="Beverage">Beverage</option>
                </select>
            </div>

            <!-- Description -->
            <div class="mb-4">
                <label for="description" class="block text-gray-300 font-semibold mb-1">Description</label>
                <textarea id="description" name="description" rows="4" required class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-yellow-400"></textarea>
            </div>

            <!-- Price -->
            <div class="mb-4">
                <label for="price" class="block text-gray-300 font-semibold mb-1">Price (₹)</label>
                <input type="number" id="price" name="price" step="0.01" required class="w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-yellow-400">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="w-full bg-yellow-500 hover:bg-yellow-400 text-gray-900 font-semibold py-2 rounded mt-4 transition duration-300">Add Food Item</button>
        </form>
    </div>

    <script>
        const toggleButton = document.getElementById('navbar-toggle');
        const navbarMenu = document.getElementById('navbar-menu');

        toggleButton.addEventListener('click', () => {
            navbarMenu.classList.toggle('hidden');
        });
    </script>
</body>
</html>
