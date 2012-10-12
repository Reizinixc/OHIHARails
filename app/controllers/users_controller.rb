class UsersController < ApplicationController

  before_filter :require_not_login, :only => [:new, :create]
  before_filter :require_login, :except => [:new, :create]

  # GET /users
  def index
    @title = "Member List"
    @users = User.all
  end

  # GET /users/:username
  def show
    begin
      @user  = User.find_by_username(params[:username])
      @title = "#{@user.name} #{@user.lastname}"
    rescue NoMethodError
      redirect_to "/user/#{params[:id]}"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

# GET /users/settings
  def edit
    @title = "Edit a Profile"
    if admin?
      @user = params[:username].nil? ? current_user : User.find(params[:username])
    else
      @user = current_user
    end
  end

# POST /users
# POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to "/user/#{@user.username}", :notice => 'User was successfully created.'
    else
      render :action => "new"
    end
  end

# PUT /users/1
  def update
    #@user = User.find(params[:username])
    @user = User.find_by_username(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to "/user/#{@user.username}", :notice => 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

# DELETE /users/1
# DELETE /users/1.json
  def destroy
    #@user = User.find(params[:username])
    if admin?
      @user = User.find_by_username(params[:id])
    else
      @user = current_user
    end
    @user.destroy

    redirect_to users_url
  end


  # This method'll delete when productioned
  def promote
    @user = current_user

    @user.position = params[:position]
    @user.password = @user.password_confirmation = params[:password]

    saved = @user.save
    redirect_to users_path, :notice => saved ? "You account has been promoted to #{t('teacher')}" : "Promotion FAILED"
  end
end