class CreateQuestionHomeworks < ActiveRecord::Migration
  def change
    create_table :question_homeworks do |t|

      t.timestamps
    end
  end
end
