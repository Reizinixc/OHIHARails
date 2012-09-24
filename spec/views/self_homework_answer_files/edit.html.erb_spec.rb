require 'spec_helper'

describe "self_homework_answer_files/edit" do
  before(:each) do
    @self_homework_answer_file = assign(:self_homework_answer_file, stub_model(SelfHomeworkAnswerFile))
  end

  it "renders the edit self_homework_answer_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => self_homework_answer_files_path(@self_homework_answer_file), :method => "post" do
    end
  end
end
