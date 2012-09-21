require 'spec_helper'

describe "self_homeworks/new" do
  before(:each) do
    assign(:self_homework, stub_model(SelfHomework).as_new_record)
  end

  it "renders new self_homework form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => self_homeworks_path, :method => "post" do
    end
  end
end
