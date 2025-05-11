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
    <title>Add New Product - LetsBuyIt Admin</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f3f5;
            padding: 40px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #343a40;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #007bff;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add New Product</h2>
        <form action="AddProductServlet.do" method="post" enctype="multipart/form-data">
        <label for="name">Product Name:</label>
        <input type="text" name="name" id="name" required /><br/>

        <label for="description">Description:</label>
        <textarea name="description" id="description" required></textarea><br/>

        <label for="price">Price:</label>
        <input type="number" name="price" id="price" step="0.01" required /><br/>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" id="quantity" required /><br/>

        <label for="imageFile">Upload Image:</label>
        <input type="file" name="imageFile" id="imageFile" accept="image/*" required /><br/><br/>

        <input type="submit" value="Add Product" />
    </form>

        <a href="adminHome.jsp" class="back-link">&larr; Back to Dashboard</a>
    </div>

</body>
</html>
