class CoursesController < ApplicationController

  before_filter :require_teacher, :except => []
  before_filter :require_admin, :only => [:destroy]

  # GET /courses
  def index
    @title = "Course List"

    @courses = Course.all
  end

  # GET /courses/new
  def new
    @title = "Course Creating"

    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @title = "Course Editing"

    @course = Course.find(params[:id])
  end

  def show
    @courses = Course.all
    render :action => "index"
  end

  # POST /courses
  # POST /courses.json
  def create
    @course            = Course.new(params[:course])
    @course.updated_by = current_user.username

    if @course.save
      redirect_to '/courses', :notice => 'Course was successfully created.'
    else
      render action: "new"
    end

  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course            = Course.find(params[:id])
    @course.updated_by = current_user.username

    if @course.update_attributes(params[:course])
      redirect_to '/courses', notice: 'Course was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end
end
