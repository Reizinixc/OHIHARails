class SelfHomeworksController < ApplicationController
  # GET /self_homeworks
  # GET /self_homeworks.json
  def index
    @self_homeworks = SelfHomework.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @self_homeworks }
    end
  end

  # GET /self_homeworks/1
  # GET /self_homeworks/1.json
  def show
    @self_homework = SelfHomework.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @self_homework }
    end
  end

  # GET /self_homeworks/new
  # GET /self_homeworks/new.json
  def new
    @self_homework = SelfHomework.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @self_homework }
    end
  end

  # GET /self_homeworks/1/edit
  def edit
    @self_homework = SelfHomework.find(params[:id])
  end

  # POST /self_homeworks
  # POST /self_homeworks.json
  def create
    @self_homework = SelfHomework.new(params[:self_homework])

    respond_to do |format|
      if @self_homework.save
        format.html { redirect_to @self_homework, notice: 'Self homework was successfully created.' }
        format.json { render json: @self_homework, status: :created, location: @self_homework }
      else
        format.html { render action: "new" }
        format.json { render json: @self_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /self_homeworks/1
  # PUT /self_homeworks/1.json
  def update
    @self_homework = SelfHomework.find(params[:id])

    respond_to do |format|
      if @self_homework.update_attributes(params[:self_homework])
        format.html { redirect_to @self_homework, notice: 'Self homework was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @self_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /self_homeworks/1
  # DELETE /self_homeworks/1.json
  def destroy
    @self_homework = SelfHomework.find(params[:id])
    @self_homework.destroy

    respond_to do |format|
      format.html { redirect_to self_homeworks_url }
      format.json { head :no_content }
    end
  end
end
