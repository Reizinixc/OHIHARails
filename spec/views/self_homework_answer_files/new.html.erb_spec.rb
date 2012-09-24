require 'spec_helper'

describe "self_homework_answer_files/new" do
  before(:each) do
    assign(:self_homework_answer_file, stub_model(SelfHomeworkAnswerFile).as_new_record)
  end

  it "renders new self_homework_answer_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => self_homework_answer_files_path, :method => "post" do
    end
  end
end
