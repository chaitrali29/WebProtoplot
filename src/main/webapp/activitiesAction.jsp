<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connection.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String logDate = request.getParameter("log_date");
    int steps = Integer.parseInt(request.getParameter("steps"));
    double distance = Double.parseDouble(request.getParameter("distance_km"));
    double calories = Double.parseDouble(request.getParameter("calories_burned"));
    int minutes = Integer.parseInt(request.getParameter("active_minutes"));
    String workout = request.getParameter("workout_type");

    List<String> logDates = new ArrayList<>();
    List<Double> calorieList = new ArrayList<>();

    try {
        Connection con = ConnectionProvider.getcon();

        // Insert data
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO fitness_logs(user_id, log_date, steps, distance_km, calories_burned, active_minutes, workout_type) VALUES (?, ?, ?, ?, ?, ?, ?)"
        );
        ps.setInt(1, userId);
        ps.setString(2, logDate);
        ps.setInt(3, steps);
        ps.setDouble(4, distance);
        ps.setDouble(5, calories);
        ps.setInt(6, minutes);
        ps.setString(7, workout);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            out.println("<h3 style='color:green;text-align:center;'>Activity Logged Successfully!</h3>");
        } else {
            out.println("<h3 style='color:red;text-align:center;'>Failed to log activity!</h3>");
        }

        // Fetch calorie data
        PreparedStatement ps2 = con.prepareStatement(
            "SELECT log_date, calories_burned FROM fitness_logs WHERE user_id = ? ORDER BY log_date ASC"
        );
        ps2.setInt(1, userId);
        ResultSet rs = ps2.executeQuery();

        while (rs.next()) {
            logDates.add(rs.getString("log_date"));
            calorieList.add(rs.getDouble("calories_burned"));
        }

        rs.close();
        ps2.close();
        ps.close();
        con.close();
%>

<!-- Chart Section -->
<div style="width: 80%; margin: 30px auto; background: white; padding: 20px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
    <h3 style="text-align: center; color: #2e7d32;">Your Calorie Progress</h3>
    <canvas id="calorieChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const labels = <%= "[" + String.join(", ", logDates.stream().map(d -> "\"" + d + "\"").toArray(String[]::new)) + "]" %>;
    const data = <%= calorieList.toString() %>;

    const ctx = document.getElementById('calorieChart').getContext('2d');
    const calorieChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Calories Burned',
                data: data,
                backgroundColor: '#66bb6a',
                borderRadius: 10
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Calories'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Date'
                    },
                    ticks: {
                        autoSkip: false,
                        maxRotation: 90,
                        minRotation: 45
                    }
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Daily Calories Burned',
                    font: {
                        size: 18
                    }
                },
                legend: {
                    display: false
                }
            }
        }
    });
</script>

<%
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
