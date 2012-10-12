class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_code, :null => false
      t.string :thai_course_name
      t.string :english_course_name
      t.string :updated_by

      t.timestamps
    end
  end
end