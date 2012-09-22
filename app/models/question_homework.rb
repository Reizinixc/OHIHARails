class QuestionHomework < Homework
  
  has_many :item, :dependent => :destroy
  
end
