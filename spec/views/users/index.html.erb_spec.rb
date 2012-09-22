require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :login => "Login",
        :password => "Password",
        :confirmation_password => "Confirmation Password",
        :name => "Name",
        :lastname => "Lastname",
        :email => "Email",
        :alt_email => "Alt Email",
        :crypted_password => "Crypted Password",
        :password_salt => "Password Salt",
        :persistence_token => "Persistence Token",
        :last_login_ip => "Last Login Ip"
      ),
      stub_model(User,
        :login => "Login",
        :password => "Password",
        :confirmation_password => "Confirmation Password",
        :name => "Name",
        :lastname => "Lastname",
        :email => "Email",
        :alt_email => "Alt Email",
        :crypted_password => "Crypted Password",
        :password_salt => "Password Salt",
        :persistence_token => "Persistence Token",
        :last_login_ip => "Last Login Ip"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Confirmation Password".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Alt Email".to_s, :count => 2
    assert_select "tr>td", :text => "Crypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Persistence Token".to_s, :count => 2
    assert_select "tr>td", :text => "Last Login Ip".to_s, :count => 2
  end
end
