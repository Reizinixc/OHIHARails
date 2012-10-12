class HomeworksController < ApplicationController

  before_filter :require_teacher, :except => [:index, :create, :edit, :destroy]

  def index
    @title = "Homework List"

    section = []
    (teacher? ? current_user.teaches : current_user.takes).each do |t|
      section << t.section_id if t.section.is_suspend? or teacher?
    end

    @sections = Section.find section

    if params[:section_id].nil?
      @homeworks = Homework.order("due_time").find_all_by_section_id(@sections)
    else
      @homeworks = Homework.order("due_time").find_all_by_section_id(params[:section_id])
    end
  end

  def new
    @title = "Create a Homework"

    @options = []
    current_user.sections.each do |section|
      course = section.course
      @options << ["#{course.english_course_name} #{get_abbr_semester_text section.semester} #{section.year}", section.id]
    end

    @homework = Homework.new
  end

  def create
    @homework = Homework.new(params[:homework])

    if @homework.save
      redirect_to homeworks_path, :notice => "Homework was successfully created."
    else
      render :action => 'new'
    end
  end

  def edit
    @title    = "Edit a Homework"

    @options = []
    current_user.sections.each do |section|
      course = section.course
      @options << ["#{course.english_course_name} #{get_abbr_semester_text section.semester} #{section.year}", section.id]
    end

    @homework = Homework.find(params[:id])
  end

  def update
    @homework = Homework.find(params[:id])

    if @homework.update_attributes(params[:homework])
      redirect_to homeworks_path, :notice => "Homework was successfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @homework = Homework.find(params[:id])

    if @homework.destroy
      redirect_to homeworks_path, :notice => "Homework was successfully deleted."
    else

    end
  end
end
