<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, za.ac.tut.entities.Product" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<html>
<head>
    <title>All Products - Admin</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f3f5;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #343a40;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #dee2e6;
            text-align: left;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
        }

        .action-links a {
            margin-right: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .action-links a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #28a745;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>All Products</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price (R)</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        <% for (Product p : products) { %>
            <tr>
                <td><%= p.getProductId() %></td>
                <td><img src="<%= p.getImagePath() %>" alt="Product Image" /></td>
                <td><%= p.getName() %></td>
                <td><%= p.getDescription() %></td>
                <td><%= String.format("%.2f", p.getPrice()) %></td>
                <td><%= p.getQuantity() %></td>
                <td class="action-links">
                    <a href="EditProductServlet.do?productId=<%= p.getProductId() %>">Edit</a>
                    <a href="DeleteProductServlet.do?productId=<%= p.getProductId() %>">Delete</a>
                </td>
            </tr>
        <% } %>
    </table>

    <a class="back-link" href="adminHome.jsp">&larr; Back to Dashboard</a>

</body>
</html>
