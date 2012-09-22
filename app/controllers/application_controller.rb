class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_user_session

  def current_user_session
    return @current_user_session if @current_user_session
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if @current_user
    @current_user = current_user_session && current_user_session.record
  end

  helper_method :title

  def title(title)
    base_title = "Online Handing in Homework Assistant"
    unless title.nil?
      "#{title} | #{base_title}"
    else
      "#{base_title}"
    end
  end
end
