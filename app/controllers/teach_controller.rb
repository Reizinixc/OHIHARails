class TeachController < ApplicationController

  before_filter :require_teacher, :except => []

  def new
  end

  def create
  end

  def destroy
  end
end
