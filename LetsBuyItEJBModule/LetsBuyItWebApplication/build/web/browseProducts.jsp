<%@ page import="za.ac.tut.entities.Product" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<html>
<head>
    <title>Browse Products - LetsBuyIt</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .products-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            width: 250px;
            padding: 20px;
            text-align: center;
        }

        .product-card img {
            max-width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 6px;
        }

        .product-card h3 {
            margin: 10px 0;
            font-size: 18px;
            color: #007bff;
        }

        .product-card p {
            margin: 5px 0;
            color: #555;
        }

        .add-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        .no-products {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <h2>Browse Products</h2>

    <div class="products-container">
        <%
            if (products == null || products.isEmpty()) {
        %>
            <div class="no-products">No products to browse at the moment.</div>
        <%
            } else {
                for (Product product : products) {
                    int qty = product.getQuantity();
        %>
            <div class="product-card">
                <img src="<%= product.getImagePath() %>" alt="Product Image" />
                <h3><%= product.getName() %></h3>
                <p><%= product.getDescription() %></p>
                <p><strong>Price:</strong> R<%= product.getPrice() %></p>
                <p><strong>Available:</strong> <%= qty %></p>
                <% if (qty > 0) { %>
                    <a class="add-btn" href="AddToCartServlet.do?productId=<%= product.getProductId() %>">Add to Cart</a>
                <% } else { %>
                    <p style="color:red; font-weight:bold;">Out of Stock</p>
                <% } %>
            </div>
        <%
                }
            }
        %>
    </div>
</body>
</html>
