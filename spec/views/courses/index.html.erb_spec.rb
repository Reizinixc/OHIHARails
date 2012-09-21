require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :course_code => "Course Code",
        :thai_course_name => "Thai Course Name",
        :eng_course_name => "Eng Course Name",
        :semester => 1
      ),
      stub_model(Course,
        :course_code => "Course Code",
        :thai_course_name => "Thai Course Name",
        :eng_course_name => "Eng Course Name",
        :semester => 1
      )
    ])
  end

  it "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Course Code".to_s, :count => 2
    assert_select "tr>td", :text => "Thai Course Name".to_s, :count => 2
    assert_select "tr>td", :text => "Eng Course Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
