class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|

      t.timestamps
    end
  end
end
