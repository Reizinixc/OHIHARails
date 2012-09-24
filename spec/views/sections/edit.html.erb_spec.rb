require 'spec_helper'

describe "sections/edit" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :year => "MyString",
      :semester => 1,
      :section => 1,
      :is_suspend => false
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path(@section), :method => "post" do
      assert_select "input#section_year", :name => "section[year]"
      assert_select "input#section_semester", :name => "section[semester]"
      assert_select "input#section_section", :name => "section[section]"
      assert_select "input#section_is_suspend", :name => "section[is_suspend]"
    end
  end
end
