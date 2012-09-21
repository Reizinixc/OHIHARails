class CreateSelfHomeworks < ActiveRecord::Migration
  def change
    create_table :self_homeworks do |t|

      t.timestamps
    end
  end
end
