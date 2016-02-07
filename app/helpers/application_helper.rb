module ApplicationHelper
  # taken from https://gist.github.com/suryart/7418454
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  # taken from https://gist.github.com/suryart/7418454
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message 
      end)
    end
    nil
  end

  # adapted from https://richonrails.com/articles/getting-a-user-s-gravatar
  def gravatar_url(email, size, secure = true)
    gravatar = Digest::MD5::hexdigest(email).downcase
    "http#{'s' if secure}://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
