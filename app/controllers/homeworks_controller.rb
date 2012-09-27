class HomeworksController < ApplicationController

  before_filter :require_teacher, :except => [:index, :handin]

  def index
    sections = []
    if teacher? or admin?
      Teach.find_all_by_user_id(current_user).each do |r|
        sections << r.section_id
      end
    else
      Takes.find_all_by_user_id(current_user).each do |r|
        sections << r.section_id
      end
    end
    # show homework management data
    begin
      @homeworks = Homework.find sections
    rescue RecordNotFound.new
      # Redirect to 501 pages
    end
  end

  def new
    @homework
  end

  def create
    # Go to homepage create
  end


  def handin
    @homework = Homework.find(params[:id])
    if is_self_homework?
      # Redirect to Single homework sending page
    else
      # Redirect to Question homework page
    end
  end

  def download
    # Do something for get all the student homework
  end
end
