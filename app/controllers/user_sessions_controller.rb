class UserSessionsController < ApplicationController
#  before_filter :require_no_user, :only => [:new, :create]
#  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to :controller => :user, :action => :show
    else
      render :action => :new
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    
    flash[:notice] = "Logout successful!"
    redirect_to "user_sessions#new"
  end
end