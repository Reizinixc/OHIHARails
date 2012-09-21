require 'spec_helper'

describe "question_homeworks/index" do
  before(:each) do
    assign(:question_homeworks, [
      stub_model(QuestionHomework),
      stub_model(QuestionHomework)
    ])
  end

  it "renders a list of question_homeworks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
