require 'spec_helper'

describe "self_homeworks/show" do
  before(:each) do
    @self_homework = assign(:self_homework, stub_model(SelfHomework))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
