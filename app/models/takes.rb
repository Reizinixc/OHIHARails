class Takes < ActiveRecord::Base

  has_many :courses
  has_many :sections

  attr_accessible :course_id,
                  :section_id

  validates :course_id,
            :section_id, :presence => true
end
