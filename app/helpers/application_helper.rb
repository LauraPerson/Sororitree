module ApplicationHelper
  def icon_helper(name, size = 2.5)
    html = "<i class='far fa-#{name}' "
    html += "style='font-size:#{size}em' "
    html += "></i>"
    html.html_safe
  end

  def last_chat
    chatroom_search = Chatroom.where(user: current_user).or(Chatroom.where(guest_user: current_user))
    if chatroom_search
      chatroom_search.last
    else
      false
    end
  end
end


