module ApplicationHelper

  def gravatar_for(user)
    gravatar_id  = Digest::MD5::hexdigest(user.alt_email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}"
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

  def get_abbr_semester_text(semester)
    case semester
      when 0
        "Summer"
      when 1
        "I"
      when 2
        "II"
      when 3
        "III"
      else
        "Unknown"
    end
  end

  def get_semester_text(semester)
    if semester == 1 or semester == 2
      "Semester #{get_abbr_semester_text semester}"
    else
      get_abbr_semester_text semester
    end
  end
end
