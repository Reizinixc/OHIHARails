class SelfHomeworkController < ApplicationController

  before_filter :require_teacher, :except => []

  def new
    @self_homework = SelfHomework.new
  end

  def create
    @self_homework = SelfHomework.new(params[:self_homework])
    # Checking
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
