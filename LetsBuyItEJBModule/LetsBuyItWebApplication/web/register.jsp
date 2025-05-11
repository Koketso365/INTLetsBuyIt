<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f2f5, #d6e0f0);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #fff;
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

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            margin-bottom: 20px;
            padding: 10px;
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
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
        <h2>User Registration</h2>

        <% String msg = request.getParameter("message");
           if (msg != null && msg.equals("success")) 
        { %>
            <div class="message">User successfully registered!</div>
        <% } %>

        <form action="RegisterServlet.do" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="hidden" name="role" value="USER" />
            <button type="submit">Register</button>
        </form>
        <a href="login.jsp">Already have an account? Login</a>
    </div>
</body>
</html>
