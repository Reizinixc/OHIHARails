require 'spec_helper'

describe "homework_answer_files/edit" do
  before(:each) do
    @homework_answer_file = assign(:homework_answer_file, stub_model(HomeworkAnswerFile,
      :ip => "MyString",
      :score => 1,
      :reason => "MyText",
      :revision => 1,
      :file_path => "MyString",
      :desciption => "MyText"
    ))
  end

  it "renders the edit homework_answer_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => homework_answer_files_path(@homework_answer_file), :method => "post" do
      assert_select "input#homework_answer_file_ip", :name => "homework_answer_file[ip]"
      assert_select "input#homework_answer_file_score", :name => "homework_answer_file[score]"
      assert_select "textarea#homework_answer_file_reason", :name => "homework_answer_file[reason]"
      assert_select "input#homework_answer_file_revision", :name => "homework_answer_file[revision]"
      assert_select "input#homework_answer_file_file_path", :name => "homework_answer_file[file_path]"
      assert_select "textarea#homework_answer_file_desciption", :name => "homework_answer_file[desciption]"
    end
  end
end
