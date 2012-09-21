require 'spec_helper'

describe "question_homeworks/show" do
  before(:each) do
    @question_homework = assign(:question_homework, stub_model(QuestionHomework))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
