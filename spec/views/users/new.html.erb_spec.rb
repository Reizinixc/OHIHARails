#require 'spec_helper'
#
#describe "users/new" do
#  before(:each) do
#    assign(:user, stub_model(User,
#      :login => "MyString",
#      :password => "MyString",
#      :confirmation_password => "MyString",
#      :name => "MyString",
#      :lastname => "MyString",
#      :email => "MyString",
#      :alt_email => "MyString",
#      :crypted_password => "MyString",
#      :password_salt => "MyString",
#      :persistence_token => "MyString",
#      :last_login_ip => "MyString"
#    ).as_new_record)
#  end
#
#  it "renders new user form" do
#    render
#
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "form", :action => users_path, :method => "post" do
#      assert_select "input#user_login", :name => "user[login]"
#      assert_select "input#user_password", :name => "user[password]"
#      assert_select "input#user_confirmation_password", :name => "user[confirmation_password]"
#      assert_select "input#user_name", :name => "user[name]"
#      assert_select "input#user_lastname", :name => "user[lastname]"
#      assert_select "input#user_email", :name => "user[email]"
#      assert_select "input#user_alt_email", :name => "user[alt_email]"
#      assert_select "input#user_crypted_password", :name => "user[crypted_password]"
#      assert_select "input#user_password_salt", :name => "user[password_salt]"
#      assert_select "input#user_persistence_token", :name => "user[persistence_token]"
#      assert_select "input#user_last_login_ip", :name => "user[last_login_ip]"
#    end
#  end
#end
