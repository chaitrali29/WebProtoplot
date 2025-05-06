<%@ page import="java.sql.*" %>
<%@ page import="connection.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup Result</title>
    <link rel="stylesheet" href="theme.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            text-align: center;
        }
        .message {
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
        }
        .success {
            background-color: #d0f0c0;
            color: green;
        }
        .error {
            background-color: #f8d7da;
            color: red;
        }
    </style>
</head>
<body>

<%
    try {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        float height = Float.parseFloat(request.getParameter("height_cm"));
        float weight = Float.parseFloat(request.getParameter("weight_kg"));

        Connection con = ConnectionProvider.getcon();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO users(name, email, password, age, gender, height_cm, weight_kg, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())"
        );
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setInt(4, age);
        ps.setString(5, gender);
        ps.setFloat(6, height);
        ps.setFloat(7, weight);
        
        int rows = ps.executeUpdate();

        if (rows > 0) {
%>
    <div class="message success">Signup successful! <a href="login.jsp">Click here to login</a>.</div>
<%
        } else {
%>
    <div class="message error">Signup failed. Please try again.</div>
<%
        }

    } catch (Exception e) {
%>
    <div class="message error">Error: <%= e.getMessage() %></div>
<%
    }
%>

<!-- Dark mode toggle -->
<label class="switch">
    <input type="checkbox" id="modeToggle">
    <span class="slider"></span>
</label>
<script src="theme.js"></script>

</body>
</html>
