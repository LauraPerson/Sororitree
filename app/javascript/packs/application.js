require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()
import { transparentNabarHome } from '../components/navbar';
import { themeChoice } from '../components/theme_choice';
import "bootstrap";
import { initChatroomCable } from '../channels/chatroom_channel';
document.addEventListener('turbolinks:load', () => {
  transparentNabarHome();
  themeChoice();
  initChatroomCable();
});
