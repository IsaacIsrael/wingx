const transparentNavbar = () => {
  if(window.location.pathname == '/') {
    console.log('awesome');
    const navbar = document.getElementById("navbar");
    navbar.classList.toggle("navbar-wagon-transparent");
  }
}
export { transparentNavbar };
