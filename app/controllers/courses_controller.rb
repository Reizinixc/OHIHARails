class CoursesController < ApplicationController

  before_filter :require_teacher, :except => []

  # GET /courses
  def index
    @courses = Course.all
    @title   = "Opening Course's List"
  end

  # GET /courses/1
  def show
    @course = Course.find_by_course_code(params[:id])
    @title  = "#{@course.english_course_name unless @course.nil?}"
  end

  # GET /courses/new
  def new
    @course = Course.new
    @title  = "Course Creating"
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find_by_course_code(params[:id])
    @title  = "Editing #{@course.english_course_name}"
  end

  # POST /courses

  def create
    @course = Course.new(params[:course])
    @course.updated_by = current_user.username

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /courses/1
  def update
    @course = Course.find_by_course_code(params[:id])
    @course.updated_by = current_user.username

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /courses/1
  def destroy
    @course = Course.find_by_course_code(params[:id])

    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
    end
  end
end
