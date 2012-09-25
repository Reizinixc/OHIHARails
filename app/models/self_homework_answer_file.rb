class SelfHomeworkAnswerFile < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :user

  belongs_to :self_homework
  validates_presence_of :self_homework

  attr_accessible :user_id,
                  :self_homework_id,
                  :description,
                  :ip,
                  :reason,
                  :score,
                  :file

  has_attached_file :file, {
      :path        => ":rails_root/public/files/homeworks/:homework_id/:username-:filename",
      :url         => "/files/homeworks/:homework_id/:hash/:filename",
      :hash_secret => "159357#{Time.current.to_s}753951"
  }

  Paperclip.interpolates :homework_id do |attachment, styles|
    attachment.instance.self_homework_id
  end

  Paperclip.interpolates :username do |attachment, styles|
    attachment.instance.username
  end


  validates :user_id, :file, :presence => true
end