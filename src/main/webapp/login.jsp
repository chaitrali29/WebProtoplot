<!DOCTYPE html>
<html>
<head>
<head>
  <title>Login | HealthCare+</title>
  <link rel="stylesheet" href="theme.css" />
  <script src="togg.js" defer></script>
</head>

</head>
<body style="margin: 0; padding: 0; font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #e8f5e9, #c8e6c9); height: 100vh; display: flex; align-items: center; justify-content: center;">

  <div style="background: white; padding: 40px 30px; border-radius: 12px; box-shadow: 0 8px 16px rgba(0,0,0,0.1); width: 100%; max-width: 400px;">
    
    <h2 style="text-align: center; color: #2e7d32; margin-bottom: 25px;">Login to HealthCare+</h2>
    
   <form action="loginAction.jsp" method="post">


      <label for="email" style="display: block; margin-bottom: 5px; font-weight: bold;">Email</label>
      <input type="email" id="email" name="email" required
             style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid #ccc; margin-bottom: 20px; font-size: 15px; box-sizing: border-box;">

      <label for="password" style="display: block; margin-bottom: 5px; font-weight: bold;">Password</label>
      <input type="password" id="password" name="password" required
             style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid #ccc; margin-bottom: 25px; font-size: 15px; box-sizing: border-box;">

      <button type="submit"
              style="width: 100%; background: #2e7d32; color: white; padding: 12px; border: none; border-radius: 6px; font-size: 16px; cursor: pointer; transition: background 0.3s;">
        Login
      </button>
    </form>

    <p style="text-align: center; margin-top: 20px; font-size: 14px;">
      Don't have an account? 
      <a href="signup.jsp" style="color: #2e7d32; text-decoration: none; font-weight: bold;">Sign Up</a>
    </p>
  </div>
<script>
// Check the current theme from localStorage
if (localStorage.getItem('theme') === 'dark') {
    document.body.classList.add('dark-mode');
}

// Toggle function
function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
    // Store the theme in localStorage
    if (document.body.classList.contains('dark-mode')) {
        localStorage.setItem('theme', 'dark');
    } else {
        localStorage.setItem('theme', 'light');
    }
}
</script>
</body>
</html>
