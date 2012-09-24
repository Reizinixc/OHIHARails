class QuestionAnswer < ActiveRecord::Base

  belongs_to :item
  validates_associated :item

  belongs_to :user
  validates_associated :user

  attr_accessible :answer,
                  :ip,
                  :reason,
                  :score,
                  :item_id,
                  :user_id

  validates :answer,
            :item_id,
            :user_id, :presence => true
end
