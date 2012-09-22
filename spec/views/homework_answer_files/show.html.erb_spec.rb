require 'spec_helper'

describe "homework_answer_files/show" do
  before(:each) do
    @homework_answer_file = assign(:homework_answer_file, stub_model(HomeworkAnswerFile,
      :ip => "Ip",
      :score => 1,
      :reason => "MyText",
      :revision => 2,
      :file_path => "File Path",
      :desciption => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ip/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/File Path/)
    rendered.should match(/MyText/)
  end
end
