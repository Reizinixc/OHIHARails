class CreateTa < ActiveRecord::Migration
  def change
    create_table :ta do |t|

      t.timestamps
    end
  end
end
