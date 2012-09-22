class QuestionAnswer < ActiveRecord::Base
  attr_accessible :answer, :ip, :reason, :score, :sent_time
  
  validates :ip, :format => { :with => /(([1-2][0-9]|[1-9])?\d.){3}([1-2][0-9]|[1-9])?\d/ }
  
  validates :sent_time, :presence => true
  
  validates :answer, :presence => true  
end
