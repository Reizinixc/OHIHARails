class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id, :null => false
      t.string :year
      t.integer :semester
      t.integer :section
      t.boolean :is_suspend

      t.timestamps
    end
  end
end
