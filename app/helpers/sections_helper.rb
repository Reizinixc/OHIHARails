module SectionsHelper

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
