<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Login - LetsBuyIt</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #d1c4e9);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            width: 300px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #218838;
        }

        a {
            display: block;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <% String error = request.getParameter("error");
        if ("invalid".equals(error)) { %>
        <div class="message" style="background-color:#f8d7da; color:#721c24; border:1px solid #f5c6cb;">
            Invalid username, password, or role.
        </div>
     <% } %>
        <h2>Login to LetsBuyIt</h2>
        <form action="LoginServlet.do" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <select name="role" required>
                <option value="">Select Role</option>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>
            <button type="submit">Login</button>
        </form>
        <a href="register.jsp">Don't have an account? Register</a>
    </div>
</body>
</html>
