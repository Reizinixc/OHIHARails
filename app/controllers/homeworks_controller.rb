class HomeworksController < ApplicationController

  before_filter :require_teacher, :except => [:index, :handin]

  def index
    @title   = "Homework List"
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
    @homework = Homework.new
    @teaches  = Teach.find_all_by_user_id current_user
  end

  def create
    type = @homework.type
    if type == "SelfHomework"
      @homework = SelfHomework.new(:params[:homework])
      if @homework.save
        flash[:notice] = "Successfully created Self Homework"
        redirect_to homeworks_path
      else
        render :action => 'homeworks/create'
      end

    else
      flash[:error] = "A Question Homework not been supported yet"
      redirect_to homeworks_path
    end
  end


  def handin
    @homework = Homework.find(params[:id])
    if is_self_homework? @homework
      @self_homework = SelfHomework.new
    else
      # Redirect to Question homework page
    end
  end

  def download
    # Do something for get all the student homework
  end
end
