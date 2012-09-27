class UserSessionsController < ApplicationController

  before_filter :require_not_login, :only => [:new, :create]
  before_filter :require_login, :except => [:new, :create]

  def new
    @user_session = UserSession.new
    @title = "Login Required"
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t('login_successful')
      redirect_to '/users'
    else
      render :action => "new"
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t("logout_successful")
    redirect_to '/login'
  end
end