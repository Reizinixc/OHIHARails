class TeachController < ApplicationController

  before_filter :require_teacher, :except => []

  def new
    @teach = Teach.new
  end

  def create
    @teach = Teach.new params[:teach]
    if Teach.where("user_id = ? AND section_id = ?", @teach.user_id, @teach.section_id).any?
      flash[:error] = "You already teach this section"
      render :action => "new"
    else
      if @teach.save
        flash[:notice] = "Successfully assign teach information"
        render :action => "new"
      else
        flash[:notice] = "Cannot save data to the database"
        render :action => "new" # Some path
      end
    end
  end

  def destroy
    @teach = Teach.find(params[:id])
    @teach.destroy
    flash[:notice] = "Successfully deleted the teach data"
    render :action => "new" # Some path
  end
end
