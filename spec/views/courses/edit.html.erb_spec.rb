#require 'spec_helper'
#
#describe "courses/edit" do
#  before(:each) do
#    @course = assign(:course, stub_model(Course,
#      :course_code => "MyString",
#      :thai_course_name => "MyString",
#      :english_course_name => "MyString"
#    ))
#  end
#
#  it "renders the edit course form" do
#    render
#
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "form", :action => courses_path(@course), :method => "post" do
#      assert_select "input#course_course_code", :name => "course[course_code]"
#      assert_select "input#course_thai_course_name", :name => "course[thai_course_name]"
#      assert_select "input#course_english_course_name", :name => "course[english_course_name]"
#    end
#  end
#end
