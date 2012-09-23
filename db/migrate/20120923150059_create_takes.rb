class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.integer :course_id
      t.integer :section_id

      t.timestamps
    end
  end
end
