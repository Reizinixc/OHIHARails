class QuestionAnswer < ActiveRecord::Base
  
  belongs_to :item
  validates_associated :item
  
  attr_accessible :answer, :ip, :reason, :score, :sent_time
  
  validates :ip, :format => { :with => /(([1-2][0-9]|[1-9])?\d.){3}([1-2][0-9]|[1-9])?\d/ }
  
  validates :sent_time, :presence => true
  
  validates :answer, :presence => true  
end
