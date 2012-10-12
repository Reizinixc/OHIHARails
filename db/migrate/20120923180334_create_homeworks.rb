class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer  :section_id, :null => false
      t.string   :title,      :null => false
      t.text     :description
      t.datetime :start_time, :null => false
      t.datetime :due_time,   :null => false
      #t.string   :type,       :null => false

      t.timestamps
    end
  end
end
