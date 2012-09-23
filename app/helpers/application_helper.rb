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

  def title(title)
    base_title = "Online Handing in Homework Assistant"
    unless title.nil?
      "#{title} | #{base_title}"
    else
      "#{base_title}"
    end
  end

  def header_name
    base_name = "#{current_user.name} #{current_user.lastname}"
    if teacher?
      "#{t('teacher')} #{base_name}"
    elsif admin?
      "#{t('admin')} #{base_name}"
    else
      base_name
    end
  end
end
