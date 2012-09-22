class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :question

      t.timestamps
    end
  end
end
