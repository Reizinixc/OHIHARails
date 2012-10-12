class HomeworksController < ApplicationController

  before_filter :require_login
  before_filter :require_teacher, :except => [:index]

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

  def show
    @homework = Homework.find(params[:id])
    @answers = @homework.answers

  end

  def new
    @title = "Create a Homework"

    @options = []
    sections = current_user.sections

    if sections.empty?
      redirect_to sections_path, :notice => "Please create section first."
      return
    end

    sections.each do |section|
      course = section.course
      @options << ["#{course.english_course_name} #{get_abbr_semester_text section.semester} #{section.year}", section.id]
    end

    @homework = Homework.new
  end

  def create
    def back_to_new
      @options = []
      sections = current_user.sections

      sections.each do |section|
        course = section.course
        @options << ["#{course.english_course_name} #{get_abbr_semester_text section.semester} #{section.year}", section.id]
      end

      render :new
    end

    @homework = Homework.new(params[:homework])

    if @homework.start_time.nil? or @homework.due_time.nil?
      flash[:notice] = "The due time and/or start time cannot be blank."
      back_to_new

    elsif @homework.due_time.to_datetime <= @homework.start_time.to_datetime or !@homework.due_time.to_datetime.future?
      flash[:notice] = "The due time must be future."
      back_to_new

    elsif @homework.save
      redirect_to homeworks_path, :notice => "Homework was successfully created."

    else
      back_to_new
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
