class QuestionHomework < Homework

  has_many :items, :dependent => :destroy

end
