class Teaches < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :section
  
  # attr_accessible :title, :body
end
