const transparentNabarHome = () => {
  const banner = document.querySelector(".banner-home")
  if (banner) {
    const navbar = document.querySelector('.navbar-sororitree');
    navbar.classList.add('nav-transparent');
    navbar.classList.add('fixed-top');
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.remove('nav-transparent');
        navbar.classList.add('nav-fixed');
      } else {
        navbar.classList.add('nav-transparent');
      }
    })
  }
}

export { transparentNabarHome };
