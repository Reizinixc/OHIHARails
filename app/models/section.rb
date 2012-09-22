class Section < ActiveRecord::Base
  
  belongs_to :course
  validates_associated :course
  
  has_many :user, :through => :takes
  has_many :user, :through => :ta
  has_many :user, :through => :teaches
  has_many :homework
  
  attr_accessible :is_suspend, :section, :year, :semester
  
  validates :year, :format => { :with => /\d{4}/ }
  validates :semester, :inclusion => { :in => 0..3 }
end
