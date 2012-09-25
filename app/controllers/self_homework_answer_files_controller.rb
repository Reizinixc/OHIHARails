class SelfHomeworkAnswerFilesController < ApplicationController

  before_filter :require_login

  # GET /self_homework_answer_files
  def index
    @self_homework_answer_files = SelfHomeworkAnswerFile.all
  end

  # GET /self_homework_answer_files/1
  def show
    @self_homework_answer_file = SelfHomeworkAnswerFile.find(params[:id])
  end

  def new
    @self_homework_answer_file      = SelfHomeworkAnswerFile.new
  end

  # GET /self_homework_answer_files/1/edit
  def edit
    @self_homework_answer_file = SelfHomeworkAnswerFile.find(params[:id])
  end

  # POST /self_homework_answer_files
  def create
    @self_homework_answer_file = SelfHomeworkAnswerFile.new(params[:self_homework_answer_file])
    @self_homework_answer_file.user = current_user

    if @self_homework_answer_file.save
      redirect_to '/homeworkfile', :notice => 'Self homework answer file was successfully created.'
    else
      render :action => "new"
    end

  end

  # PUT /self_homework_answer_files/1
  def update
    @self_homework_answer_file = SelfHomeworkAnswerFile.find(params[:id])

    if @self_homework_answer_file.update_attributes(params[:self_homework_answer_file])
      redirect_to @self_homework_answer_file, :notice => 'Self homework answer file was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /self_homework_answer_files/1
  def destroy
    @self_homework_answer_file = SelfHomeworkAnswerFile.find(params[:id])
    @self_homework_answer_file.destroy

    redirect_to '/homeworkfile'
  end
end
