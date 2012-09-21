class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :thai_course_name
      t.string :eng_course_name
      t.string :year
      t.integer :semester

      t.timestamps
    end
  end
end
