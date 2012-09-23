#require 'spec_helper'
#
#describe "courses/index" do
#  before(:each) do
#    assign(:courses, [
#      stub_model(Course,
#        :course_code => "Course Code",
#        :thai_course_name => "Thai Course Name",
#        :english_course_name => "English Course Name"
#      ),
#      stub_model(Course,
#        :course_code => "Course Code",
#        :thai_course_name => "Thai Course Name",
#        :english_course_name => "English Course Name"
#      )
#    ])
#  end
#
#  it "should renders a list of courses" do
#    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "Course Code".to_s, :count => 2
#    assert_select "tr>td", :text => "Thai Course Name".to_s, :count => 2
#    assert_select "tr>td", :text => "English Course Name".to_s, :count => 2
#  end
#end
