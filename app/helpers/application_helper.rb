module ApplicationHelper

  def gravatar_for(user, width, height)
    gravatar_id  = Digest::MD5::hexdigest(user.alt_email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    desc         = "#{user.name} #{user.lastname}'s photo"
    image_tag gravatar_url,
              :alt    => desc,
              :title  => desc,
              :id     => "gravatar",
              :width  => width,
              :height => height
  end

  def teacher?
    false if current_user.nil?
  else
    current_user.position == 't'
  end

  def header_name
    if teacher?
      "#{t('teacher')} #{current_user.name} #{current_user.lastname}"
    else
      "#{current_user.name} #{current_user.lastname}"
    end
  end

end
