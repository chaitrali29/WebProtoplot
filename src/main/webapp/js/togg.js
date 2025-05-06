// theme.js

document.addEventListener("DOMContentLoaded", () => {
  const currentMode = localStorage.getItem('theme') || 'light';
  document.body.classList.add(currentMode + "-mode");

  const toggle = document.getElementById('modeToggle');
  if (toggle) {
    toggle.checked = currentMode === 'dark';

    toggle.addEventListener('change', () => {
      document.body.classList.toggle('light-mode');
      document.body.classList.toggle('dark-mode');
      localStorage.setItem('theme', toggle.checked ? 'dark' : 'light');
    });
  }
});
