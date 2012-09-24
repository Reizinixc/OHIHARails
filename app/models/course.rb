class Course < ActiveRecord::Base

  has_many :section, :dependent => :destroy

  attr_accessible :course_code,
                  :english_course_name,
                  :thai_course_name,
                  :updated_by

  validates :course_code, :presence => true

  validates :course_code, :format => { :with => /[0-9]{8}/ },
                          :uniqueness => true

  def to_param
    course_code
  end
end
