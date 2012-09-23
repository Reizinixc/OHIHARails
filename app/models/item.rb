class Item < ActiveRecord::Base

  belongs_to :question_homework
  validates_associated :question_homework

  has_many :question_answers, :dependent => :destroy

  attr_accessible :question_homework_id,
                  :question

  validates :question_homework_id,
            :question, :presence => true
end
