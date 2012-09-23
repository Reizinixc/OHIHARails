class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @title = "Member List"
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_username(params[:username])
    unless @user.nil?
      @title = "#{@user.name} #{@user.lastname}"
    end

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
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
  # PUT /users/1.json
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
    @user = User.find_by_username(params[:id])
    @user.destroy

    redirect_to users_url
  end
end