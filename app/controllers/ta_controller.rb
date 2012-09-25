class TaController < ApplicationController

  before_filter :require_teacher, :only => [:new, :create]
  before_filter :require_login, :except => [:new, :create]

  def new
    @ta = TA.new
  end

  def create
    @ta = TA.new(params[:ta])

    @ta.user_id = current_user.id

    begin
      Section.readonly.find(@ta.section_id)
    rescue
      flash[:notice] = "Section is not valid"
      redirect_to :action => :new
      return
    end

    if @ta.save
      redirect_to @section, notice => 'Section was successfully created.'
    else
      render :action => :new
    end
  end

  def destroy
  end
end
