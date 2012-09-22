require 'spec_helper'

describe User do
  
  @user = User.new(:login => "kunemata",
                   :password => "1234",
                   :confirmation_password => "1234",
                   :email => "kunemata@example.com",
                   :alt_email => "kunemata@example.net",
                   :name => "Kune",
                   :lastname => "Keiseiie")
    
  describe "Database Schema" do
    it { should have_db_colomn(:login).of_type(:string) }
  end
  
end
