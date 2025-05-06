<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="theme.css">
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
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

<h1>Sign Up</h1>

<form method="post" action="signupAction.jsp">
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
    <button type="submit">Sign Up</button>
</form>

<!-- Dark mode toggle -->
<label class="switch">
    <input type="checkbox" id="modeToggle">
    <span class="slider"></span>
</label>
<script src="theme.js"></script>

</body>
</html>
