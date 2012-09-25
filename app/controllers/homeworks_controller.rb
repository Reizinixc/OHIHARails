class HomeworksController < ApplicationController

  before_filter :require_teacher, :except => [:index, :handin]

  def index
    sections = []
    table = (teacher? or admin?) ? Teach : Takes

    # show homework management data
    table.find_by_user(current_user).each do |r|
      sections << r.section_id
    end
    begin
      @homeworks = Homework.find sections
    rescue RecordNotFound
      # Redirect to 501 pages

    end
  end

  def create
    # Go to homepage create
  end


  def handin
    @homework = Homework.find(params[:id])
    if is_self_homework?
      # Redirect to Single homework sending page
    else
      # Redirect to QUestion homework page
    end
  end

  def download
    # Do something for get all the student homework
  end

end
