require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :course_code => "MyString",
      :thai_course_name => "MyString",
      :eng_course_name => "MyString",
      :semester => 1
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path, :method => "post" do
      assert_select "input#course_course_code", :name => "course[course_code]"
      assert_select "input#course_thai_course_name", :name => "course[thai_course_name]"
      assert_select "input#course_eng_course_name", :name => "course[eng_course_name]"
      assert_select "input#course_semester", :name => "course[semester]"
    end
  end
end
