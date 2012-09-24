require 'spec_helper'

describe "self_homework_answer_files/index" do
  before(:each) do
    assign(:self_homework_answer_files, [
      stub_model(SelfHomeworkAnswerFile),
      stub_model(SelfHomeworkAnswerFile)
    ])
  end

  it "renders a list of self_homework_answer_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
