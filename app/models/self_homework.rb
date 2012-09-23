class SelfHomework < Homework

  has_many :self_homework_answer_files, :dependent => :destroy

end
