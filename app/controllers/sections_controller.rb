class SectionsController < ApplicationController

  before_filter :require_teacher, :except => []

  # GET /sections
  def index
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /sections/1
  def show
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /sections/new
  def new
    @section           = Section.new
    @section.course_id = params[:course_code]
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @section        = Section.new(params[:section])
    @section.course = Course.find_by_course_code(params[:section][:course_id])
    if Section.where("course_id = ? AND section = ? AND year = ? AND section = ?", @section.course, @section.section, @section.year, @section.section).any?
      flash[:notice] = "This section in this course was created"
      render :action => "new"
    elsif @section.save
        redirect_to @section, :notice => "Section was successfully created."
    else
      render action: "new"
    end
  end

# PUT /sections/1
# PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

# DELETE /sections/1
# DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to sections_url
  end

end
