<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Play Game - FitTrack</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5fff9;
    }

    .container {
      width: 90%;
      margin: auto;
      padding: 40px 20px;
    }

    h1 {
      text-align: center;
      font-size: 2.5em;
      margin-bottom: 40px;
      background: linear-gradient(135deg, #43cea2, #185a9d);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .game-cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 30px;
    }

    .card {
      background-color: #ffffff;
      border-radius: 16px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
      padding: 30px 20px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.12);
    }

    .card h2 {
      color: #2e7d32;
      font-size: 22px;
      margin-bottom: 15px;
    }

    .card p {
      color: #555;
      font-size: 16px;
      margin-bottom: 20px;
    }

    .card button {
      background-color: #43cea2;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 15px;
      transition: background-color 0.2s ease;
    }

    .card button:hover {
      background-color: #36b191;
    }

    footer {
      background-color: #333;
      color: white;
      text-align: center;
      padding: 20px 0;
      margin-top: 50px;
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>🎮 Let's Play!</h1>
    <div class="game-cards">

      <div class="card">
        <h2>📋 Fitness Quiz</h2>
        <p>Test your knowledge about health, nutrition, and workouts.</p>
        <form action="quiz.jsp">
          <button type="submit">Start Quiz</button>
        </form>
      </div>

      <div class="card">
        <h2>🧠 Match the Pairs</h2>
        <p>Match exercises with their benefits or target muscles!</p>
        <form action="match.jsp">
          <button type="submit">Start Matching</button>
        </form>
      </div>

      <div class="card">
        <h2>❓ Choose Correct</h2>
        <p>Pick the right option from fitness-based questions.</p>
        <form action="choose.jsp">
          <button type="submit">Play Now</button>
        </form>
      </div>

    </div>
  </div>

  <footer>
    <p>&copy; 2024 FitTrack. Keep Moving, Keep Winning!</p>
  </footer>

</body>
</html>
