class AnswersController < ApplicationController

  before_filter :require_login
  before_filter :require_teacher, :only => [:download, :grade, :grade_update]

  def new
    @title = "Homework Creating"

    # Find a homework ID
    @homework = nil
    begin
      @homework = Homework.find(params[:homework_id])
    rescue RecordNotFound.new
      redirect_to homeworks_path, :notice => "Cannot recognize the homework"
    end

    if time_up? @homework
      redirect_to homeworks_path, :notice => "This assignment is TIME UP!"
      return
    end

    # Check duplicate
    answer = get_handed_answer(@homework)

    if answer.nil?
      @answer = Answer.new
    else
      redirect_to edit_answer_path(:id => answer.id) unless answer.nil?
    end
  end

  def create
    @homework = Homework.find(params[:answer][:homework_id])
    if time_up? @homework
      redirect_to homeworks_path, :notice => "This assignment is TIME UP!"
      return
    end

    # Update Attribute file
    @answer            = Answer.new(params[:answer])
    @answer.sent_time  = DateTime.now
    #@answer.user = current_user
    @answer.student_id = current_user.id
    @answer.ip         = request.remote_ip

    if @answer.save
      redirect_to homeworks_path, :notice => "The homework was successfully handed in."
    else
      render :new
    end
  end

  def edit
    @title = "Editing Homework"

    @answer   = Answer.find(params[:id])
    @homework = @answer.homework
  end

  def update
    @homework = Homework.find(params[:answer][:homework_id])

    if time_up? @homework
      redirect_to homeworks_path, :notice => "This assignment is TIME UP!"
      return
    end

    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params[:answer])
      @answer            = Answer.new(params[:answer])
      @answer.sent_time  = DateTime.now
      #@answer.user = current_user
      @answer.student_id = current_user.id
      @answer.ip         = request.remote_ip
      redirect_to homeworks_path, :notice => "Homework was successfully updated."
    else
      render :edit
    end
  end

  def download

  end

  def grade
    @title = "Homework Grading"

    begin
      @answer = Answer.find(params[:answer_id])
    rescue
      redirect_to homeworks_path, :notice => "Cannot find the specificed homework."
      return
    end

    @student = User.find(@answer.student_id)

  end

  def grade_update
    @answer = Answer.find(params[:answer_id])

    if Integer(params[:answer][:score]) < 0
      flash[:notice] = "Score must be greater than or equal 0"
      @student = User.find(@answer.student_id)
      render :grade
    else
      if @answer.update_attributes(params[:answer])
        redirect_to "/homeworks/#{@answer.homework_id}", :notice => "The homework had been graded successfully"
      else
        @student = User.find(@answer.student_id)
        render :grade
      end
    end
  end


  def time_up?(homework)
    homework.due_time.to_datetime < DateTime.now
  end

  def get_handed_answer(homework)
    homework_answer = homework.answers
    student_id      = current_user.id

    homework_answer.each do |answer|
      if answer.student_id == student_id
        return answer
      end
    end

    return nil
  end

end
