class AnswersController < ApplicationController

  # GET /answers/new
  def new
    if params[:homework_id].nil? or Homework.find(params[:homework_id]).nil?
      redirect_to homeworks_path, :notice => "Cannot recognize the homework"
      return
    end

    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  def create
    @answer = Answer.new(params[:answer])

    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /answers/1
  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params[:answer])
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /answers/1
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    format.html { redirect_to homeworks_path }
  end
end
