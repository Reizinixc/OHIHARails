class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :due_date
      t.boolean :is_suspend

      t.timestamps
    end
  end
end
