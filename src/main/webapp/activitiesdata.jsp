<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Log Activity</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e9f5ec;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2e7d32;
        }
        form {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        button {
            width: 100%;
            background: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
        }
        .readonly {
            background: #f5f5f5;
        }
    </style>
    <script>
        function calculateCalories() {
            const steps = parseInt(document.getElementById("steps").value) || 0;
            const minutes = parseInt(document.getElementById("active_minutes").value) || 0;
            const distance = parseFloat(document.getElementById("distance_km").value) || 0;

            // Basic formula: (steps * 0.04) + (active_minutes * 5) + (distance_km * 30)
            const calories = (steps * 0.04) + (minutes * 5) + (distance * 30);
            document.getElementById("calories_burned").value = calories.toFixed(2);
        }
    </script>
</head>
<body>

<h2>Log Your Activity</h2>

<form action="activitiesAction.jsp" method="post">
    <input type="number" name="user_id" placeholder="User ID" required />

    <input type="date" name="log_date" required />

    <input type="number" id="steps" name="steps" placeholder="Steps" required oninput="calculateCalories()" />

    <input type="number" id="distance_km" name="distance_km" placeholder="Distance (km)" step="0.01" required oninput="calculateCalories()" />

    <input type="number" id="active_minutes" name="active_minutes" placeholder="Active Minutes" required oninput="calculateCalories()" />

    <select name="workout_type" required>
        <option value="">Select Workout Type</option>
        <option value="Walking">Walking</option>
        <option value="Running">Running</option>
        <option value="Cycling">Cycling</option>
        <option value="Gym">Gym</option>
        <option value="Yoga">Yoga</option>
    </select>

    <input type="text" id="calories_burned" name="calories_burned" placeholder="Calories Burned" readonly class="readonly" />

    <button type="submit">Submit Activity</button>
</form>

</body>
</html>
