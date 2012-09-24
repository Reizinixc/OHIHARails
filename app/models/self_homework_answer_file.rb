class SelfHomeworkAnswerFile < ActiveRecord::Base

  belongs_to :user
  validates_associated :user

  belongs_to :self_homework
  validates_associated :self_homework

  attr_accessible :user_id,
                  :self_homework_id,
                  :description,
                  :ip,
                  :reason,
                  :score

  has_attached_file :file, {
  :path => ":rails_root/public/system/homework/:id/"
  }

  validates :user_id, :file, :presence => true
end