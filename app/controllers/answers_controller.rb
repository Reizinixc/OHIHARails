class AnswersController < ApplicationController

  before_filter :require_login
  before_filter :require_teacher, :only => [:download]

  def new
    # Find a homework ID
    @homework = Homework.find(params[:homework_id])

    @answer = Answer.new
  end

  def create

  end

  def edit

  end

  def destroy

  end

  def download

  end

end
