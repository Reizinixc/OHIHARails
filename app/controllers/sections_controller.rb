class SectionsController < ApplicationController

  before_filter :require_teacher, :except => []

  # GET /sections
  def index
    @sections = current_user.sections.order("year DESC").order("semester DESC").order("section").order("is_suspend DESC")

    if teacher?
      if Teach.find_by_user_id(current_user)
        @courses = []
      else
        @courses = Course.find(get_course_id_from_sections(current_user.sections))
      end
    end
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
  def create
    # Check the blank course code
    if params[:course_code].nil? or params[:course_code] == ""
      redirect_to new_section_path, :notice => "Course code cannot be blank."
      return
    end

    # new the section object and set the attribute value from input form in /sections/new
    @section = Section.new(params[:section])

    # Find the course object by inputed course code
    course   = Course.find_by_course_code(params[:course_code])

    # Check the course is found?
    if course.nil?
      # If not found we'll back user to input form again and display the error via flash[:notice]

      flash[:notice] = "Cannot find the course with course code '#{params[:course_code]}'"
      render :action => "new"
      return
    else
      # If found we gonna to assign it in to section object for reference (section belongs_to course)
      @section.course = course
    end

    # Finding is section object'll duplicate to other section in the database
    if section_duplicate? course
      # The section we gonna to create it is duplicate with other section
      flash[:notice] = "This section is duplicate with other section"
      render :action => "new"
      return
    end

    # Section object can save to the database?
    if @section.save
      # If section object saved successfully, we'll create section creator to the section's teacher
      t = Teach.new(:section => @section, :user => current_user)

      # Check if teach can save to the database
      if t.save
        # If successful we redirect to the section main page and display the successful result
        redirect_to sections_path, :notice => "Section was successfully created."
      else
        # If not successful we back the user to the input form and display the error msg.
        flash[:notice] = "An error occured when assign user to the teach's list"
        render :action => "new"
      end
    else
      # If section object saved failed, we back to the input form and user'll try again
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

    redirect_to sections_url, :notice => "Section was sucessfully deleted."
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
