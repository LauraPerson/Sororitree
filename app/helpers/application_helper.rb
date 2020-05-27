module ApplicationHelper
  def icon_helper(name, size = 2.5)
    html = "<i class='far fa-#{name}' "
    html += "style='font-size:#{size}em' "
    html += "></i>"
    html.html_safe
  end
end
