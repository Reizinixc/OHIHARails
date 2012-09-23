class ApplicationController < ActionController::Base
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
    false if current_user.nil?
  else
    current_user.position == 't'
  end

  def admin?
    false if current_user.nil?
  else
    current_user.position == 'a'
  end

  def require_teacher
    if current_user
      unless teacher?
        flash[:error] = "You must be a #{t('teacher')} to continue"
        redirect_to "/user/#{current_user.username}"
      end
    else
      require_login
    end

  end

  def require_admin
    if current_user
      unless teacher?
        flash[:error] = "You must be a #{t('admin')} to continue"
        redirect_to "/user/#{current_user.username}"
      end
    else
      require_login
    end
  end
end
