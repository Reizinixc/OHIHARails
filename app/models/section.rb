class Section < ActiveRecord::Base

  belongs_to :course
  validates_associated :course

  has_many :takes, :dependent => :destroy
  has_many :users, :through => :takes

  has_many :teaches, :dependent => :destroy
  has_many :users, :through => :teaches

  has_many :homeworks, :dependent => :destroy

  attr_accessible :section,
                  :semester,
                  :year,
                  :is_suspend,
                  :course_id,
                  :course

  validates :section,
            :semester,
            :year,
            :course_id, :presence => true

  validates :section, :numericality => { :greater_than => 0 }

  validates :semester, :numericality => { :only_integer => true, :less_than => 6 }

  validates :year, :format => { :with => /[0-9]{1,4}/ }

  validates :is_suspend, :inclusion => { :in => [true, false] }

end