class Homework < ActiveRecord::Base

  belongs_to :section
  validates_associated :section

  has_many :answers, :dependent => :destroy

  attr_accessible :section_id,
                  :description,
                  :due_time,
                  :start_time,
                  :title

  validates :due_time,
            :start_time,
            :title,
            :section_id, :presence => true
end
