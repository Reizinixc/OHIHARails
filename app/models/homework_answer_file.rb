class HomeworkAnswerFile < ActiveRecord::Base
  attr_accessible :desciption, :file_path, :ip, :reason, :revision, :score, :sent_time
  
  validates :ip, :format => { :with => /(([1-2][0-9]|[1-9])?\d.){3}([1-2][0-9]|[1-9])?\d/ }
  validates :sent_time, :presence => true
  
  validates :revision, :numericality => { :greater_than => 0 }
  
end
