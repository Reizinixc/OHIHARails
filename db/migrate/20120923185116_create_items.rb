class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :question, :null => false
      t.integer :question_homework_id, :null => false

      t.timestamps
    end
  end
end
