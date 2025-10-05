<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsiveness -->
    <title>All Customers</title>
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

    <section class="content relative z-10 py-24 bg-transparent">
        <div class="w-full max-w-7xl mx-auto px-4 md:px-8">
            <div class="main-data p-8 sm:p-14 bg-gray-900 bg-opacity-80 rounded-3xl">
                <h2 class="text-center font-manrope font-semibold text-4xl text-purple-400 mb-16">All Customers</h2>

                <!-- Column Headers -->
                <div class="grid grid-cols-8 pb-9">
                    <div class="col-span-8 lg:col-span-4">
                        <p class="font-medium text-lg leading-8 text-indigo-400">Customer Name</p>
                    </div>
                    <div class="col-span-2 max-lg:hidden">
                        <p class="font-medium text-lg leading-8 text-gray-400">Email</p>
                    </div>
                    <div class="col-span-1 max-lg:hidden flex items-center">
                        <p class="font-medium text-lg leading-8 text-gray-400">Contact</p>
                    </div>
                    <div class="col-span-1 max-lg:hidden">
                        <p class="font-medium text-lg leading-8 text-gray-400">Total Order</p>
                    </div>
                </div>

                <!-- Customer Data Rows -->
                <c:choose>
                    <c:when test="${!empty cust}">
                        <c:forEach var="customer" items="${cust}">
                        <a href="/admin/customerorder?cid=${customer.cid}">
                            <div class="box p-8 rounded-3xl bg-gray-700 grid grid-cols-8 mb-7 cursor-pointer transition-all duration-500">
                                <div class="col-span-8 sm:col-span-4 lg:col-span-3 flex flex-col max-lg:items-center">
                                    <h5 class="font-manrope font-semibold text-2xl leading-9 text-white mb-1">${customer.firstname} ${customer.lastname}</h5>
                                    <p class="font-normal text-base leading-7 text-gray-300">Customer ID: ${customer.cid}</p>
                                </div>

                                <div class="col-span-8 sm:col-span-4 lg:col-span-3 flex items-center justify-center">
                                    <p class="font-semibold text-xl leading-8 text-white">${customer.email}</p>
                                </div>
                                <div class="col-span-8 sm:col-span-4 lg:col-span-1 flex items-center justify-center">
                                    <p class="font-semibold text-xl leading-8 text-indigo-400">${customer.contactnumber}</p>
                                </div>
                                <div class="col-span-8 sm:col-span-4 lg:col-span-1 flex items-center justify-center">
                                    <p class="font-semibold text-xl leading-8 text-white">${customer.totalorder}</p>
                                </div>
                            </div></a>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <div class="text-center py-10">
                            <h1 class="text-red-500 text-2xl font-semibold">No Customer Found</h1>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>
</body>
</html>
