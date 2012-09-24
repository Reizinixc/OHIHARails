require 'spec_helper'

describe "self_homework_answer_files/show" do
  before(:each) do
    @self_homework_answer_file = assign(:self_homework_answer_file, stub_model(SelfHomeworkAnswerFile))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
