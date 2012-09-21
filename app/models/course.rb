class Course < ActiveRecord::Base
  attr_accessible :course_code, :eng_course_name, :semester, :thai_course_name, :year
  
  validates :course_code, 
            :semester, 
            :thai_course_name, 
            :year, :presence => true
  
  validates :course_code, :length => { :is => 8 }
  
  # English course must be characters
  validates :eng_course_name, :format => { :with => /\w+/ }
  
  validates :year, :format => { :with => /\d{4}/ }
  
  validates :semester, :inclusion => { :in => 0..3 }
   
end
