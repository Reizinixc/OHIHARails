class ApplicationController < ActionController::Base

  include ApplicationHelper

  protect_from_forgery


  helper_method :require_login, :require_not_login

  def require_login
    unless current_user
      flash[:error] = t('error_login_first')
      redirect_to login_url
    end
  end

  def require_not_login
    if current_user
      #flash[:error] = "You're already logged in."
      redirect_to users_path
    end
  end


  helper_method :current_user, :current_user_session

  def current_user_session
    return @current_user_session if @current_user_session
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if @current_user
    @current_user = current_user_session && current_user_session.record
  end


  helper_method :teacher?, :admin?, :require_teacher, :require_admin

  def teacher?
    if current_user.nil?
      false
    else
      current_user.position == 't'
    end
  end

  def admin?
    if current_user.nil?
      false
    else
      current_user.position == 'a'
    end
  end

  def require_teacher
    if current_user
      unless teacher? or admin?
        flash[:error] = "You must be a #{t('teacher')} to continue"
        redirect_to "/user/#{current_user.username}"
      end
    else
      require_login
    end
  end

  def require_admin
    if current_user
      unless admin?
        flash[:error] = "You must be a #{t('admin')} to continue"
        redirect_to "/user/#{current_user.username}"
      end
    else
      require_login
    end
  end

  def ta?(section)
    begin
      result = TA.where "user_id = ? AND section_id = ?", current_user.id, section.id
      result.any?
    rescue
      false
    end
  end


  def get_course_id_from_sections(sections)
    if sections.empty?
      []
    else
      course_id_list = []
      sections.each do |section|
        course_id_list << section.course.id
      end
      Course.find course_id_list
    end
  end

end
