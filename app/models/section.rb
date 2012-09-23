class Section < ActiveRecord::Base

  belongs_to :course
  validates_associated :course

  has_many :users, :through => :tas

  has_many :users, :through => :takeses

  has_many :users, :through => :teaches

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

  validates :semester, :numericality => { :only_integer => true, :less_than => 6 }

  validates :year, :format => { :with => /[0-9]{1,4}/ }

  validates :is_suspend, :inclusion => { :in => [true, false] }

end