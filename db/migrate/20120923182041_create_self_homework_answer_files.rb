class CreateSelfHomeworkAnswerFiles < ActiveRecord::Migration
  def change
    create_table :self_homework_answer_files do |t|
      t.integer :user_id,          :null => false
      t.integer :self_homework_id, :null => false
      t.string :ip
      t.integer :score
      t.string :reason
      t.text :description
      t.attachment :file

      t.timestamps
    end
  end
end
