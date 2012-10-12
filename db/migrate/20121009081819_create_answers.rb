class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :student_id, :null => false
      t.integer :homework_id, :null => false
      t.text :description
      #t.datetime :sent_time, :null => false
      t.datetime :sent_time
      t.string :ip
      t.attachment :file

      t.timestamps
    end
  end
end
