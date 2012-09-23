class Section < ActiveRecord::Base

  belongs_to :course

  has_many :courses, :through => :tas

  has_many :courses, :through => :takeses

  attr_accessible :section,
                  :semester,
                  :year,
                  :is_suspend,
                  :course_id

  validates :section,
            :semester,
            :year,
            :is_suspend,
            :course_id, :presence => true

  validates :section, :numericality => { :greater_than => 0 }

  validates :semester, :numericality => { :only_integer => true, :greater_than => 6 }

  validates :year, :format => { :with => /[0-9]{1,4}/ }

  validates :is_suspend, :inclusion => { :in => [true, false] }

end