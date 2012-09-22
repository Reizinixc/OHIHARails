class HomeworkAnswerFilesController < ApplicationController
  # GET /homework_answer_files
  # GET /homework_answer_files.json
  def index
    @homework_answer_files = HomeworkAnswerFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homework_answer_files }
    end
  end

  # GET /homework_answer_files/1
  # GET /homework_answer_files/1.json
  def show
    @homework_answer_file = HomeworkAnswerFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homework_answer_file }
    end
  end

  # GET /homework_answer_files/new
  # GET /homework_answer_files/new.json
  def new
    @homework_answer_file = HomeworkAnswerFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @homework_answer_file }
    end
  end

  # GET /homework_answer_files/1/edit
  def edit
    @homework_answer_file = HomeworkAnswerFile.find(params[:id])
  end

  # POST /homework_answer_files
  # POST /homework_answer_files.json
  def create
    @homework_answer_file = HomeworkAnswerFile.new(params[:homework_answer_file])
    @homework_answer_file.ip = "127.0.0.1"
    @homework_answer_file.revision = 1
    @homework_answer_file.sent_time = Date.current

    respond_to do |format|
      if @homework_answer_file.save
        format.html { redirect_to @homework_answer_file, notice: 'Homework answer file was successfully created.' }
        format.json { render json: @homework_answer_file, status: :created, location: @homework_answer_file }
      else
        format.html { render action: "new" }
        format.json { render json: @homework_answer_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homework_answer_files/1
  # PUT /homework_answer_files/1.json
  def update
    @homework_answer_file = HomeworkAnswerFile.find(params[:id])

    respond_to do |format|
      if @homework_answer_file.update_attributes(params[:homework_answer_file])
        format.html { redirect_to @homework_answer_file, notice: 'Homework answer file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @homework_answer_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homework_answer_files/1
  # DELETE /homework_answer_files/1.json
  def destroy
    @homework_answer_file = HomeworkAnswerFile.find(params[:id])
    @homework_answer_file.destroy

    respond_to do |format|
      format.html { redirect_to homework_answer_files_url }
      format.json { head :no_content }
    end
  end
end
