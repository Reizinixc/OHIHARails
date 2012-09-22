class Item < ActiveRecord::Base
  
  belongs_to :question_homework
  validates_associated :question_homework
  
  has_many :question_answer, :dependent => :destroy
  
  attr_accessible :question
end
