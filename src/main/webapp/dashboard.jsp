<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[][] quotes = {
        {"Take care of your body. It's the only place you have to live.", "Jim Rohn"},
        {"Health is the greatest gift, contentment the greatest wealth.", "Buddha"},
        {"To enjoy the glow of good health, you must exercise.", "Gene Tunney"},
        {"Wellness is the complete integration of body, mind, and spirit.", "Greg Anderson"},
        {"A healthy outside starts from the inside.", "Robert Urich"}
    };

    int index = (int) (Math.random() * quotes.length);
    String quote = quotes[index][0];
    String author = quotes[index][1];
%>
<!DOCTYPE html>
<html>
<head>
  <title>Welcome | HealthCare+</title>

  <style>
    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #c8e6c9, #a5d6a7);
      font-family: 'Segoe UI', sans-serif;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #2e7d32;
      transition: opacity 1s ease-in-out;
    }

    .quote-box {
      text-align: center;
      padding: 40px;
      border-radius: 12px;
      background: white;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      max-width: 600px;
    }

    .quote {
      font-size: 24px;
      font-weight: 600;
      margin-bottom: 20px;
    }

    .author {
      font-size: 18px;
      font-style: italic;
      color: #388e3c;
    }

    .fade-out {
      opacity: 0;
    }
  </style>
</head>
<body>
  <div class="quote-box">
    <div class="quote">"<%= quote %>"</div>
    <div class="author">– <%= author %></div>
  </div>

  <script>
    // After 3 seconds, fade out and redirect to home.jsp
    setTimeout(() => {
      document.body.classList.add("fade-out");
      setTimeout(() => {
        window.location.href = "welcome.jsp";
      }, 1000); // wait for fade
    }, 3000);
  </script>
</body>
</html>
