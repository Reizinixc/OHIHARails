class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.datetime :sent_time
      t.string :ip
      t.integer :score
      t.text :reason
      t.text :answer

      t.timestamps
    end
  end
end
