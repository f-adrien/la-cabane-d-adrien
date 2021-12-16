function showPassword(e) {
  console.log(document.getElementById("visible-password-input"))
  console.log(document.getElementById("visible-password-input").type)
  const passwordInput = document.getElementById("visible-password-input");
  if (passwordInput) {
    if (e.target.classList.contains('icon-view-visible') || (e.target.closest("svg") != null && e.target.closest("svg").classList.contains('icon-view-visible'))) {
      if (passwordInput.type == "password") {
        passwordInput.type = "text";
      } else {
        passwordInput.type = "password";
      };
    };
  };
};

document.addEventListener('click', showPassword);

function cleanScript() {
  document.removeEventListener('turbo:before-cache', cleanScript);
  document.removeEventListener('click', showPassword);
  document.getElementById('users-sessions-new').remove();
};

document.addEventListener('turbo:before-cache', cleanScript);