class Homework < ActiveRecord::Base
  
  belongs_to :section
  
  attr_accessible :description, :due_date, :is_suspend, :start_date, :title, :type
  
  validates :due_date,
            :start_date,
            :title,
            :type, :presence => true
  
end
