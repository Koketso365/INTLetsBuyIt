<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Purchase Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            text-align: center;
            padding: 50px;
        }

        .message-box {
            background: #fff;
            border-radius: 8px;
            padding: 30px;
            display: inline-block;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h2 {
            color: #28a745;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h2>Thank You!</h2>
        <p><%= request.getAttribute("message") %></p>
        <p><a href="browseProducts.jsp">Continue Shopping</a></p>
    </div>
</body>
</html>
