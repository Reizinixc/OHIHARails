class TakesController < ApplicationController

  before_filter :require_teacher

  def new
    @take = Take.new

    @options = []
    current_user.sections.each do |section|
      course = section.course
      @options << ["#{course.english_course_name} #{get_abbr_semester_text section.semester} #{section.year}", section.id]
    end
  end

  def create
    @take       = Take.new(params[:take])

    #sucessful_list = []
    failed_list = []

    if params[:student_list_file].nil?
      student_list = params[:student_list_text].gsub(" ", "").split(",")

      student_list.each do |student|
        #student = "b" + student
        user = User.find_by_username(student)
        if user.nil?
          failed_list << student
        else
          take = Take.new(:section_id => params[:take][:section_id], :user => user)
          unless take.save
            failed_list << line
          end
        end
      end


    else
      student_list_file = params[:student_list_file].open()

      student_list_file.readlines.each do |line|
        line = "b" + line.gsub("\n", "")
        user = User.find_by_username(line)
        if user.nil?
          failed_list << line
        else
          take = Take.new(:section_id => params[:take][:section_id], :user => user)
          unless take.save
            failed_list << line
          end
        end
      end
      student_list_file.close()
    end


    if failed_list.empty?
      redirect_to sections_path, :notice => "Successfully add user to course"
    else
      flash[:notice] = "Here is the student list who cannot add to the section. Please check to student's id and try again\n #{failed_list.to_s}"
      redirect_to '/take/new'
    end


  end

  def destroy
  end
end
