class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id, :null => false
      t.string  :year, :null => false
      t.integer :semester, :null => false
      t.integer :section, :null => false
      t.boolean :is_suspend, :null => false

      t.timestamps
    end
  end
end
