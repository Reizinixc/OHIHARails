module ApplicationHelper

  def gravatar_for(user, width, height)
    gravatar_id  = Digest::MD5::hexdigest(user.alt_email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url,
              :alt    => "#{user.name} #{user.lastname}'s photo",
              :id     => "gravatar",
              :width  => width,
              :height => height
  end

end
