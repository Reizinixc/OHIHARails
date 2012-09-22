require 'spec_helper'

describe "homework_answer_files/index" do
  before(:each) do
    assign(:homework_answer_files, [
      stub_model(HomeworkAnswerFile,
        :ip => "Ip",
        :score => 1,
        :reason => "MyText",
        :revision => 2,
        :file_path => "File Path",
        :desciption => "MyText"
      ),
      stub_model(HomeworkAnswerFile,
        :ip => "Ip",
        :score => 1,
        :reason => "MyText",
        :revision => 2,
        :file_path => "File Path",
        :desciption => "MyText"
      )
    ])
  end

  it "renders a list of homework_answer_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "File Path".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
