class Take < ActiveRecord::Base

  belongs_to :section
  belongs_to :user

  attr_accessible :user_id,
                  :section_id

  validates :user_id,
            :section_id, :presence => true
end
