class Course < ActiveRecord::Base

  has_many :sections, :dependent => :destroy

  attr_accessible :course_code,
                  :thai_course_name,
                  :english_course_name,
                  :updated_by

  validates :course_code, :presence => true, :uniqueness => true
  validates :updated_by, :presence => true
end
