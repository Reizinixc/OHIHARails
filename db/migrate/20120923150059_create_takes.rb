class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.integer :user_id, :null => false
      t.integer :section_id, :null => false

      t.timestamps
    end
  end
end
