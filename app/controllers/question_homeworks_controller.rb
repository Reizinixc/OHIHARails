class QuestionHomeworksController < ApplicationController
  # GET /question_homeworks
  # GET /question_homeworks.json
  def index
    @question_homeworks = QuestionHomework.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_homeworks }
    end
  end

  # GET /question_homeworks/1
  # GET /question_homeworks/1.json
  def show
    @question_homework = QuestionHomework.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_homework }
    end
  end

  # GET /question_homeworks/new
  # GET /question_homeworks/new.json
  def new
    @question_homework = QuestionHomework.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_homework }
    end
  end

  # GET /question_homeworks/1/edit
  def edit
    @question_homework = QuestionHomework.find(params[:id])
  end

  # POST /question_homeworks
  # POST /question_homeworks.json
  def create
    @question_homework = QuestionHomework.new(params[:question_homework])

    respond_to do |format|
      if @question_homework.save
        format.html { redirect_to @question_homework, notice: 'Question homework was successfully created.' }
        format.json { render json: @question_homework, status: :created, location: @question_homework }
      else
        format.html { render action: "new" }
        format.json { render json: @question_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_homeworks/1
  # PUT /question_homeworks/1.json
  def update
    @question_homework = QuestionHomework.find(params[:id])

    respond_to do |format|
      if @question_homework.update_attributes(params[:question_homework])
        format.html { redirect_to @question_homework, notice: 'Question homework was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_homeworks/1
  # DELETE /question_homeworks/1.json
  def destroy
    @question_homework = QuestionHomework.find(params[:id])
    @question_homework.destroy

    respond_to do |format|
      format.html { redirect_to question_homeworks_url }
      format.json { head :no_content }
    end
  end
end
