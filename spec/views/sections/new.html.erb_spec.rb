require 'spec_helper'

describe "sections/new" do
  before(:each) do
    assign(:section, stub_model(Section,
      :year => "MyString",
      :semester => 1,
      :section => 1,
      :is_suspend => false
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path, :method => "post" do
      assert_select "input#section_year", :name => "section[year]"
      assert_select "input#section_semester", :name => "section[semester]"
      assert_select "input#section_section", :name => "section[section]"
      assert_select "input#section_is_suspend", :name => "section[is_suspend]"
    end
  end
end
