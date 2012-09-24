class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :user_id, :null => false
      t.integer :item_id, :null => false
      t.string :ip
      t.integer :score
      t.string :reason
      t.text :answer

      t.timestamps
    end
  end
end
