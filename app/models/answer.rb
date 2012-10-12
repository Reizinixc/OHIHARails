class Answer < ActiveRecord::Base

  belongs_to :user
  validates_associated :user

  belongs_to :homework
  validates_associated :homework

  attr_accessible :description,
                  :homework_id,
                  :ip,
                  :sent_time,
                  :student_id,
                  :user,
                  :homework

  has_attached_file :file,
                    :url => "/:attachment/:id/:username-:filename",
                    :path => ":rails_root/public/system/:attachment/:id/:username-:filename"

  Paperclip.interpolates :username do |attachment, style|
    attachment.instance.get_username
  end

  def get_username
    "#{self.user.username}"
  end

  validates :student_id, :homework_id, :file, :sent_time, :presence => true
end
