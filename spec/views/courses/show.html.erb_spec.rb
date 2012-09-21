require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :course_code => "Course Code",
      :thai_course_name => "Thai Course Name",
      :eng_course_name => "Eng Course Name",
      :semester => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Course Code/)
    rendered.should match(/Thai Course Name/)
    rendered.should match(/Eng Course Name/)
    rendered.should match(/1/)
  end
end
