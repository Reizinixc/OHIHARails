class CreateTeaches < ActiveRecord::Migration
  def change
    create_table :teaches do |t|
      t.integer :user_id, :null => false
      t.integer :section_id, :_null => false

      t.timestamps
    end
  end
end
