class ItemController < ApplicationController

  before_filter :require_teacher, :except => []

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:id])

    if @item.save

    else

    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
