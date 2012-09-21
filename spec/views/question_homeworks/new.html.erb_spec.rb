require 'spec_helper'

describe "question_homeworks/new" do
  before(:each) do
    assign(:question_homework, stub_model(QuestionHomework).as_new_record)
  end

  it "renders new question_homework form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_homeworks_path, :method => "post" do
    end
  end
end
