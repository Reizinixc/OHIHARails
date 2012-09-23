class TA < ActiveRecord::Base

  has_many :sections
  has_many :users

  attr_accessible :user_id,
                  :section_id

  validates :user_id,
            :section_id, :presence => true
end
