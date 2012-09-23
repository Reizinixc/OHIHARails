class UsersController < ApplicationController

  before_filter :require_not_login, :only => [:new, :create]
  before_filter :require_login, :except => [:new, :create, :destroy]

  # GET /users
  def index
    @title = "Member List"
    @users = User.all
  end

  # GET /users/:username
  def show
    @user  = User.find_by_username(params[:username])
    @title = "#{@user.name} #{@user.lastname}"
  end

  # GET /users/new
  def new
    @user = User.new
  end

# GET /users/settings
  def edit
    #@user = User.find(params[:username])
    @user = current_user
  end

# POST /users
# POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/user/#{@user.username}", notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

# PUT /users/1
  def update
    #@user = User.find(params[:username])
    @user = User.find_by_username(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.html { redirect_to "/user/#{@user.username}", :notice => 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
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
end