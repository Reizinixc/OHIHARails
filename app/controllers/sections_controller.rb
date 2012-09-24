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
    @section = Section.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
      else
        format.html { render action: "new" }
      end
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
