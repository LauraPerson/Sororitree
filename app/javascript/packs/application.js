require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()

import { transparentNabarHome } from '../components/navbar';
import { themeChoice } from '../components/theme_choice';
import { matchChoice } from '../components/match_choice';
import { matchChoiceProf } from '../components/match_choice_prof';
import { initBtnRequest } from '../components/init_btn_request';
import "bootstrap";
import { initChatroomCable } from '../channels/chatroom_channel';
import { initNotifications } from '../channels/notifications_unread';
import { cardAvatarHover, cardAvatarSelect, initBtnAvatar } from '../components/select_avatar';

document.addEventListener('turbolinks:load', () => {
  transparentNabarHome();
  cardAvatarHover();
  cardAvatarSelect();
  themeChoice();
  matchChoice();
  matchChoiceProf();
  initBtnRequest();
  initChatroomCable();
  initNotifications();
  initBtnAvatar();
});
