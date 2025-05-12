<%@page import="za.ac.tut.entities.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    
    User user = (session != null) ? (User) session.getAttribute("user") : null;

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>User Dashboard - LetsBuyIt</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
        }

        header {
            background-color: #007bff;
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        header .user-info {
            font-size: 16px;
        }

        .container {
            padding: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .card h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .card p {
            color: #555;
        }

        .actions a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .actions a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>LetsBuyIt - Welcome</h1>
        <div class="user-info">
            Hello, <strong><%= user.getUsername() %></strong> |
            <a href="LogoutServlet" style="color: #fff; text-decoration: underline;">Logout</a>
        </div>
    </header>

    <div class="container">
        <div class="card">
            <h2>Welcome to LetsBuyIt!</h2>
            <p>Browse through our amazing products and start shopping.</p>

            <div class="actions">
                <a href="ViewProductsServlet.do">Browse Products</a>
                <a href="ViewCart.jsp">View Cart</a>
                <a href="OrdersServlet">My Orders</a>
            </div>
        </div>
    </div>
</body>
</html>
