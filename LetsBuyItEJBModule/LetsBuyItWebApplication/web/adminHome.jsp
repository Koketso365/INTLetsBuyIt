<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="za.ac.tut.entities.User" %>
<%
    User admin = (session != null) ? (User) session.getAttribute("user") : null;

    if (admin == null || !admin.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard - LetsBuyIt</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .welcome {
            font-size: 24px;
            margin-bottom: 30px;
            color: #333;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .action-box {
            background-color: #e9ecef;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            transition: 0.3s;
        }

        .action-box:hover {
            background-color: #d6d8db;
        }

        .action-box a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            font-size: 16px;
        }

        .logout {
            margin-top: 40px;
            text-align: center;
        }

        .logout a {
            color: #dc3545;
            text-decoration: none;
            font-weight: bold;
        }

        .logout a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>LetsBuyIt Admin Dashboard</h1>
    </div>

    <div class="container">
        <div class="welcome">Welcome, <%= admin.getUsername()%>!</div>

        <div class="actions">
            <div class="action-box">
                <a href="ViewAllProductsServlet.do">View All Products</a>
            </div>
            <div class="action-box">
                <a href="addProduct.jsp">Add New Product</a>
            </div>
            <div class="action-box">
                <a href="viewPurchases.jsp">View Purchases</a>
            </div>
            <!-- Add more admin actions as needed -->
        </div>

        <div class="logout">
            <a href="LogoutServlet.do">Logout</a>
        </div>
    </div>
</body>
</html>
