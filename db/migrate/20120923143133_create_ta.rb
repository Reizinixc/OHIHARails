class CreateTa < ActiveRecord::Migration
  def change
    create_table :ta do |t|
      t.integer :user_id,  :null => false
      t.integer :section_id, :null => false

      t.timestamps
    end
  end
end
