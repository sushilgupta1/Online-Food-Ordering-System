<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>Admin Dashboard</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        * {
            font-family: 'Nunito', sans-serif;
        }
        .bg-cover {
            background-image: url('/photo/foodbanner.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
    </style>
</head>
<body class="bg-cover bg-gray-900 bg-opacity-60 text-white min-h-screen flex flex-col justify-center items-center">

    <!-- Dark overlay to enhance text readability over the background -->
    <div class="absolute inset-0 bg-gray-900 opacity-70"></div>

    <!-- Content Wrapper -->
    <div class="relative z-10 text-center mb-10">
        <header>
            <h1 class="text-4xl font-bold mb-2">Admin Dashboard</h1>
            <p class="text-gray-400">Manage food items with ease</p>
        </header>

        <!-- Main Container -->
        <div class="w-full max-w-4xl mx-auto grid gap-8 sm:grid-cols-1 md:grid-cols-2 mt-10">
            
            <!-- Add Food Item Section -->
            <a href="addfooditem" class="block p-6 bg-gray-800 bg-opacity-80 rounded-lg shadow-lg hover:bg-gray-700 transform hover:scale-105 transition duration-300">
                <div class="flex items-center">
                    <div class="text-3xl text-yellow-400 mr-4">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-semibold">Add Food Item</h2>
                        <p class="text-gray-400">Create a new food item for the menu.</p>
                    </div>
                </div>
            </a>

            <!-- View All Food Section -->
            <a href="getallfood" class="block p-6 bg-gray-800 bg-opacity-80 rounded-lg shadow-lg hover:bg-gray-700 transform hover:scale-105 transition duration-300">
                <div class="flex items-center">
                    <div class="text-3xl text-green-400 mr-4">
                        <i class="fas fa-list"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-semibold">View All Food</h2>
                        <p class="text-gray-400">See the complete list of available food items.</p>
                    </div>
                </div>
            </a>

            <!-- See All Customers Section -->
            <a href="allcustomers" class="block p-6 bg-gray-800 bg-opacity-80 rounded-lg shadow-lg hover:bg-gray-700 transform hover:scale-105 transition duration-300">
                <div class="flex items-center">
                    <div class="text-3xl text-blue-400 mr-4">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-semibold">See All Customers</h2>
                        <p class="text-gray-400">View the list of all registered customers.</p>
                    </div>
                </div>
            </a>

            <!-- See All Orders Section -->
            <a href="allorders" class="block p-6 bg-gray-800 bg-opacity-80 rounded-lg shadow-lg hover:bg-gray-700 transform hover:scale-105 transition duration-300">
                <div class="flex items-center">
                    <div class="text-3xl text-orange-400 mr-4">
                        <i class="fas fa-receipt"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-semibold">See All Orders</h2>
                        <p class="text-gray-400">Check the complete list of customer orders.</p>
                    </div>
                </div>
            </a>

            <!-- Centered Manage Items Section -->
            <div class="flex justify-center col-span-2 md:col-span-2">
                <a href="manage" class="block p-6 bg-gray-800 bg-opacity-80 rounded-lg shadow-lg hover:bg-gray-700 transform hover:scale-105 transition duration-300">
                    <div class="flex items-center">
                        <div class="text-3xl text-purple-400 mr-4">
                            <i class="fas fa-cog"></i>
                        </div>
                        <div>
                            <h2 class="text-2xl font-semibold">Manage Items</h2>
                            <p class="text-gray-400">Modify or remove existing food items.</p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>

    <!-- Font Awesome for Icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
