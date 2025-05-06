<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="connection.ConnectionProvider" %>
<link rel="stylesheet" href="theme.css">
<!DOCTYPE html>
<html>
<head>
    <title>User Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0fff5;
            padding: 20px;
        }
        h1 {
            text-align: center;
            background: linear-gradient(135deg, #4CAF50, #81C784);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 40px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #d0f0c0;
        }
        form {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>


<h1>User Data</h1>

<%
    // Handle form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        float height = Float.parseFloat(request.getParameter("height_cm"));
        float weight = Float.parseFloat(request.getParameter("weight_kg"));

        try {
            Connection con = ConnectionProvider.getcon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users(name, email, password, age, gender, height_cm, weight_kg, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setInt(4, age);
            ps.setString(5, gender);
            ps.setFloat(6, height);
            ps.setFloat(7, weight);
            ps.executeUpdate();
        } catch(Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }

    // Display users
    try {
        Connection con = ConnectionProvider.getcon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Password</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Height (cm)</th>
        <th>Weight (kg)</th>
        <th>Created At</th>
    </tr>
<%
        while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("password") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getString("gender") %></td>
        <td><%= rs.getFloat("height_cm") %></td>
        <td><%= rs.getFloat("weight_kg") %></td>
        <td><%= rs.getTimestamp("created_at") %></td>
    </tr>
<%
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
    }
%>
</table>

<h2 style="text-align:center;">Add New User</h2>
<form method="post" action="usersdata.jsp">
    <input type="text" name="name" placeholder="Name" required />
    <input type="email" name="email" placeholder="Email" required />
    <input type="password" name="password" placeholder="Password" required />
    <input type="number" name="age" placeholder="Age" required />
    <select name="gender" required>
        <option value="">Select Gender</option>
        <option value="female">Female</option>
        <option value="male">Male</option>
        <option value="other">Other</option>
    </select>
    <input type="number" step="0.01" name="height_cm" placeholder="Height (cm)" required />
    <input type="number" step="0.01" name="weight_kg" placeholder="Weight (kg)" required />
    <button type="submit">Add User</button>
</form>

</body>
</html>
