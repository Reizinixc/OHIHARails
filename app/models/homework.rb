class Homework < ActiveRecord::Base
  attr_accessible :description, :due_date, :is_suspend, :start_date, :title
end
