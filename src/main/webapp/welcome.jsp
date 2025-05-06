<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Dashboard Overview</title>
  <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0fff5;
        color: #000;
        height: 100vh;
        transition: background-color 0.3s, color 0.3s;
    }

    .dark-mode {
        background-color: #121212;
        color: #f0f0f0;
    }

    .container {
        width: 90%;
        margin: auto;
        padding: 40px 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 40px;
        font-size: 2.5em;
        font-weight: bold;
        background: linear-gradient(135deg, #4CAF50, #81C784);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .grid-boxes {
        display: grid;
        grid-template-columns: 1fr;
        gap: 30px;
    }

    .box-link {
        text-decoration: none;
    }

    .box {
        background-color: #ffffff;
        padding: 30px 20px;
        border-radius: 16px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: all 0.3s ease;
    }

    .dark-mode .box {
        background-color: #1e1e1e;
        box-shadow: 0 8px 20px rgba(255, 255, 255, 0.1);
    }

    .box:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
    }

    .dark-mode .box:hover {
        box-shadow: 0 12px 25px rgba(255, 255, 255, 0.2);
    }

    .box h2 {
        font-size: 22px;
        color: #2e7d32;
        margin-bottom: 15px;
    }

    .dark-mode .box h2 {
        color: #81C784;
    }

    .box p {
        font-size: 16px;
        color: #555;
    }

    .dark-mode .box p {
        color: #ccc;
    }

    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 20px 0;
        position: relative;
        bottom: 0;
        width: 100%;
    }

    .switch {
      position: fixed;
      top: 20px;
      right: 20px;
      display: inline-block;
      width: 60px;
      height: 34px;
    }

    .switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: .4s;
      border-radius: 34px;
    }

    .slider:before {
      position: absolute;
      content: "";
      height: 26px;
      width: 26px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }

    input:checked + .slider {
      background-color: #4CAF50;
    }

    input:checked + .slider:before {
      transform: translateX(26px);
    }
  </style>
</head>
<body>
  <!-- Toggle Button -->
  <label class="switch">
    <input type="checkbox" id="modeToggle">
    <span class="slider"></span>
  </label>

  <div class="container">
    <h1>Dashboard Overview</h1>
    <div class="grid-boxes">

      <!-- Users Box Removed -->

      <a href="activitiesdata.jsp" class="box-link">
        <div class="box">
          <img src="img/activities.jpg" alt="Activities" style="width: 60px; height: 60px; margin-bottom: 15px;" />
          <h2>Activities</h2>
          <p>Monitor steps, workouts, and active minutes.</p>
        </div>
      </a>

    

      <a href="playgame.jsp" class="box-link">
        <div class="box">
        <!--   <img src="images/game.png" alt="Play Game" style="width: 60px; height: 60px; margin-bottom: 15px;" /> -->
        
          <h2>Play Game</h2>
          <p>Engage in fun health-based games and challenges.</p>
        </div>
      </a>

    </div>
  </div>

  <script>
    const toggle = document.getElementById('modeToggle');

    window.onload = () => {
      const savedTheme = localStorage.getItem('theme');
      if (savedTheme === 'dark') {
        document.body.classList.add('dark-mode');
        toggle.checked = true;
      }
    };

    toggle.addEventListener('change', () => {
      if (toggle.checked) {
        document.body.classList.add('dark-mode');
        localStorage.setItem('theme', 'dark');
      } else {
        document.body.classList.remove('dark-mode');
        localStorage.setItem('theme', 'light');
      }
    });
  </script>

  <footer>
    <p>&copy; 2024 FitTrack. All rights reserved.</p>
  </footer>
</body>
</html>
