const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-sororitree');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > window.innerHeight/2) {
        navbar.classList.add('navbar-sororitree-transparent');
      } else {
        navbar.classList.remove('navbar-sororitree-transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
