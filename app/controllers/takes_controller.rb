class TakesController < ApplicationController

  before_filter :require_login, :except => []

  def new
  end

  def create
  end

  def destroy
  end
end
