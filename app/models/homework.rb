class Homework < ActiveRecord::Base

  belongs_to :section
  validates_associated :section

  attr_accessible :section_id,
                  :description,
                  :due_time,
                  :start_time,
                  :title,
                  :type

  validates :due_time,
            :start_time,
            :title,
            :type, :presence => true
end
