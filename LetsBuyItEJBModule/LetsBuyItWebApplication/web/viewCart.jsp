<%@page import="za.ac.tut.entities.Product"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<Product>();
        session.setAttribute("cart", cart);
    }

    double total = 0;
    for (Product p : cart) {
        total += p.getPrice();
    }
%>

<html>
<head>
    <title>Your Cart - LetsBuyIt</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #343a40;
        }

        .cart-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .cart-item {
            display: flex;
            align-items: center;
            background: #fff;
            margin-bottom: 15px;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .cart-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 6px;
            margin-right: 20px;
        }

        .cart-details {
            flex-grow: 1;
        }

        .cart-details h3 {
            margin: 0;
            color: #007bff;
        }

        .cart-details p {
            margin: 5px 0;
            color: #555;
        }

        .cart-total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            color: #333;
        }

        .empty-msg {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 50px;
        }

        .btn-checkout {
            display: block;
            width: 200px;
            margin: 30px auto 0;
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 12px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .btn-checkout:hover {
            background-color: #218838;
        }

        .btn-remove {
            margin-top: 10px;
            background-color: #dc3545;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-remove:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <h2>Your Shopping Cart</h2>

    <div class="cart-container">
        <% if (cart.isEmpty()) { %>
            <div class="empty-msg">Your cart is currently empty.</div>
        <% } else {
            for (Product product : cart) {
        %>
            <div class="cart-item">
                <img src="<%= product.getImagePath()%>" alt="Product Image">
                <div class="cart-details">
                    <h3><%= product.getName() %></h3>
                    <p><%= product.getDescription() %></p>
                    <p><strong>Price:</strong> R<%= product.getPrice() %></p>

                    <form action="RemoveFromCartServlet.do" method="post">
                        <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                        <input type="submit" value="Remove" class="btn-remove" />
                    </form>
                </div>
            </div>
        <% } %>

        <div class="cart-total">
            Total: $<%= String.format("%.2f", total) %>
        </div>

        <a class="btn-checkout" href="PurchaseServlet.do">Proceed to Purchase</a>
        <% } %>
    </div>

</body>
</html>
