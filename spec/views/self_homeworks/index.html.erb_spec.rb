require 'spec_helper'

describe "self_homeworks/index" do
  before(:each) do
    assign(:self_homeworks, [
      stub_model(SelfHomework),
      stub_model(SelfHomework)
    ])
  end

  it "renders a list of self_homeworks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
