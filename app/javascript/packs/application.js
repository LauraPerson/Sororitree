import { initUpdateNavbarOnScroll } from '../components/navbar';

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";


document.addEventListener('turbolinks:load', () => {
  initUpdateNavbarOnScroll();
});
