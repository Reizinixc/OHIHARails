class HomeworksController < ApplicationController

  before_filter :require_teacher, :except => [:index, :handin]

  def index
    if teacher? or admin?
      # show homework management data
    else
      # show your section's homework
    end
  end

  def create
  end

  def handin
  end

  def download
  end
end
