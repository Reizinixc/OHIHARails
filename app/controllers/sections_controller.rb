class SectionsController < ApplicationController

  before_filter :require_teacher, :except => []

  # GET /sections
  def index
    @sections = current_user.sections.order("year DESC").order("semester DESC").order("section").order("is_suspend DESC")
  end

  # GET /sections/1
  def show
    @section = Section.find(params[:id])
  end

  # GET /sections/new
  def new
    @section = Section.new((params[:course_code] unless params[:course_code].nil?))
  end

  # GET /sections/1/edit
  def edit
    @section             = Section.find(params[:id])
    params[:course_code] = @section.course.course_code
    params[:semester]    = @section.semester
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    course = Course.find_by_course_code params[:course_code]
    if course.nil?
      flash[:notice] = "Cannot find the course with course code #{params[:course_code]}"
      render :action => "new"
    else
      @section.course = course
    end

    # Find duplicate section
    if section_duplicate? course
      flash[:notice] = "This section is duplicate with other section"
      render :action => "new"
      return
    end

    if @section.save
      t = Teach.new(:section => @section, :user => current_user)
      t.save
      if t.save
        redirect_to sections_path, :notice => "Section was successfully created."
      else
        flash[:notice] = "An error occured when assign user to the teach's list"
        render :action => "new"
      end
    else
      render :action => "new"
    end
  end

# PUT /sections/1
# PUT /sections/1.json
  def update
    @section = Section.find(params[:id])
    course   = Course.find_by_course_code params[:course_code]

    if !Section.where("course_id = ? AND section = ? AND semester = ? AND year = ?", course.id, params[:section][:section], params[:section][:semester], params[:section][:year]).empty?
      flash[:notice] = "This section is duplicate with other section. If you want to go back to Section's List, please click the \"Section\" at the main menu."
      render :action => "edit"
      return
    end

    @section.course = course

    if @section.update_attributes(params[:section])
      redirect_to sections_path, notice: 'Section was successfully updated.'
    else
      render :action => "edit"
    end
  end

# DELETE /sections/1
# DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to sections_url
  end

  def toggle_activate
    @section            = Section.find(params[:id])
    @section.is_suspend = !@section.is_suspend

    if @section.save
      redirect_to sections_path, :notice => "The #{@section.course.english_course_name} has been #{"de" unless @section.is_suspend}activated"
    end
  end

  def section_duplicate?(course)
    !Section.where("course_id = ? AND section = ? AND semester = ? AND year = ?", course.id, @section.section, @section.semester, @section.year).empty?
  end

end
