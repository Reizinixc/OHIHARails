class CreateHomeworkAnswerFiles < ActiveRecord::Migration
  def change
    create_table :homework_answer_files do |t|
      t.datetime :sent_time
      t.string :ip
      t.integer :score
      t.text :reason
      t.integer :revision
      t.string :file_path
      t.text :desciption

      t.timestamps
    end
  end
end
