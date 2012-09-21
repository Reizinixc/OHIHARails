require 'spec_helper'

describe "self_homeworks/edit" do
  before(:each) do
    @self_homework = assign(:self_homework, stub_model(SelfHomework))
  end

  it "renders the edit self_homework form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => self_homeworks_path(@self_homework), :method => "post" do
    end
  end
end
