const initTransparentNavbar = () => {
  if(window.location.pathname == '/') {
    const navbar = document.getElementById("navbar");
    const logo = document.getElementById("logo");
    logo.src="/assets/logo-white.png"
    navbar.classList.toggle("navbar-wagon-transparent");
  }
}
export { initTransparentNavbar };
