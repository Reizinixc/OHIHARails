require 'spec_helper'

describe "question_answers/index" do
  before(:each) do
    assign(:question_answers, [
      stub_model(QuestionAnswer,
        :ip => "Ip",
        :score => 1,
        :reason => "MyText",
        :answer => "MyText"
      ),
      stub_model(QuestionAnswer,
        :ip => "Ip",
        :score => 1,
        :reason => "MyText",
        :answer => "MyText"
      )
    ])
  end

  it "renders a list of question_answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
