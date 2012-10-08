module HomeworksHelper

  def is_self_homework?(homework)
    homework.nil? and homework.type.instance_of?(SelfHomework)
  end

  def is_question_homework?(homework)
    homework.type.instance_of?(QuestionHomework)
  end

end
