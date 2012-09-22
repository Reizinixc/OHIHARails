require 'spec_helper'

describe "question_answers/edit" do
  before(:each) do
    @question_answer = assign(:question_answer, stub_model(QuestionAnswer,
      :ip => "MyString",
      :score => 1,
      :reason => "MyText",
      :answer => "MyText"
    ))
  end

  it "renders the edit question_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_answers_path(@question_answer), :method => "post" do
      assert_select "input#question_answer_ip", :name => "question_answer[ip]"
      assert_select "input#question_answer_score", :name => "question_answer[score]"
      assert_select "textarea#question_answer_reason", :name => "question_answer[reason]"
      assert_select "textarea#question_answer_answer", :name => "question_answer[answer]"
    end
  end
end
