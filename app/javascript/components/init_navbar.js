const initTransparentNavbar = () => {
  if(window.location.pathname == '/') {
    const navbar = document.getElementById("navbar");
    navbar.classList.toggle("navbar-wagon-transparent");
  }
}
export { initTransparentNavbar };
