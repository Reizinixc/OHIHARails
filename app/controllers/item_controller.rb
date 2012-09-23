class ItemController < ApplicationController

  before_filter :require_teacher, :except => []

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
