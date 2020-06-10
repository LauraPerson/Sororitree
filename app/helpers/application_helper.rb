module ApplicationHelper
  def icon_helper(name, size = 2.5)
    html = "<i class='far fa-#{name}' "
    html += "style='font-size:#{size}em' "
    html += "></i>"
    html.html_safe
  end

  def last_chat
    chatroom_search = Chatroom.where(user: current_user).or(Chatroom.where(guest_user: current_user))
    last_message = Message.where(chatroom: chatroom_search).last
    if last_message.nil?
      false
    else
      last_chat = last_message.chatroom
    end
  end
end


