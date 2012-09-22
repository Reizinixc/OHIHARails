require 'spec_helper'

describe "question_answers/new" do
  before(:each) do
    assign(:question_answer, stub_model(QuestionAnswer,
      :ip => "MyString",
      :score => 1,
      :reason => "MyText",
      :answer => "MyText"
    ).as_new_record)
  end

  it "renders new question_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_answers_path, :method => "post" do
      assert_select "input#question_answer_ip", :name => "question_answer[ip]"
      assert_select "input#question_answer_score", :name => "question_answer[score]"
      assert_select "textarea#question_answer_reason", :name => "question_answer[reason]"
      assert_select "textarea#question_answer_answer", :name => "question_answer[answer]"
    end
  end
end
