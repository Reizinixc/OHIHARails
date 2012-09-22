class Course < ActiveRecord::Base
  
  ## Association
  has_many :section, :dependent => :destroy

  attr_accessible :course_code, :eng_course_name, :thai_course_name

  ## Validations
  validates :course_code,
            :semester,
            :thai_course_name,
            :year, :presence => true

  validates :course_code, :length => { :is => 8 }, :uniqueness => true

  # English course must be characters
  validates :eng_course_name, :format => { :with => /\w+/ }

end
