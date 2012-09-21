require 'spec_helper'

describe "question_homeworks/edit" do
  before(:each) do
    @question_homework = assign(:question_homework, stub_model(QuestionHomework))
  end

  it "renders the edit question_homework form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_homeworks_path(@question_homework), :method => "post" do
    end
  end
end
