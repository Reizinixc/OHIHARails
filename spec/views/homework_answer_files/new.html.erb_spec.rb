require 'spec_helper'

describe "homework_answer_files/new" do
  before(:each) do
    assign(:homework_answer_file, stub_model(HomeworkAnswerFile,
      :ip => "MyString",
      :score => 1,
      :reason => "MyText",
      :revision => 1,
      :file_path => "MyString",
      :desciption => "MyText"
    ).as_new_record)
  end

  it "renders new homework_answer_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => homework_answer_files_path, :method => "post" do
      assert_select "input#homework_answer_file_ip", :name => "homework_answer_file[ip]"
      assert_select "input#homework_answer_file_score", :name => "homework_answer_file[score]"
      assert_select "textarea#homework_answer_file_reason", :name => "homework_answer_file[reason]"
      assert_select "input#homework_answer_file_revision", :name => "homework_answer_file[revision]"
      assert_select "input#homework_answer_file_file_path", :name => "homework_answer_file[file_path]"
      assert_select "textarea#homework_answer_file_desciption", :name => "homework_answer_file[desciption]"
    end
  end
end
