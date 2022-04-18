import 'chartkick/chart.js';

// reload page when using history
window.addEventListener('popstate', function (e) {
  const state = e.state;
  console.log(window.location.pathname)
  if (state !== null) {
    location.reload();
  }
});