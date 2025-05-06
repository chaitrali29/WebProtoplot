<%@ page import="java.sql.*" %>
<%@ page import="connection.ConnectionProvider" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = ConnectionProvider.getcon(); // ✅ Use your custom connection class

        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password); // You should hash passwords in production

        rs = ps.executeQuery();

        if (rs.next()) {
            // ✅ Login successful
            session.setAttribute("userId", rs.getInt("user_id"));
            session.setAttribute("userName", rs.getString("name"));

            response.sendRedirect("dashboard.jsp");
        } else {
            // ❌ Login failed
%>
            <script>
                alert("Invalid email or password!");
                window.location.href = "login.jsp";
            </script>
<%
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
