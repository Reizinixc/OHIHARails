require 'spec_helper'

describe User do

  context "Database Schema" do
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:lastname).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:alt_email).of_type(:string) }
    #it { should have_db_column(:type).of_type(:string) }

    it { should have_db_column(:crypted_password).of_type(:string) }
    it { should have_db_column(:password_salt).of_type(:string) }
    it { should have_db_column(:persistence_token).of_type(:string) }

    it { should have_db_column(:last_login_at).of_type(:datetime) }
    it { should have_db_column(:last_login_ip).of_type(:string) }

    it { should_not have_db_column :password }
    it { should_not have_db_column :confirmation_password }
  end

  context "Association" do
    pending "Test when Section model generated"
  end

  context "Validation" do
    #it { should validate_format_of(:username).with(/((g\w+)|(b\w+)|(f\w+)){,11}/) }
    #it { should validate_format_of(:type).with(/s|t/) }

    it { should validate_uniqueness_of :email }

    it { should validate_presence_of :username }
    it { should validate_presence_of :name }
    it { should validate_presence_of :lastname }
    it { should validate_presence_of :email }
    it { should validate_presence_of :alt_email }
    #it { should validate_presence_of :type }
  end

  context "Add user" do
    before(:each) do
      password = "12345"
      @user    = User.new(:username              => "gkitakira",
                          :password              => password,
                          :password_confirmation => password,
                          :header_name                  => "Kita",
                          :lastname              => "Kira",
                          :email                 => "kitakira@icj.ac.th",
                          :alt_email             => "kitakira@nixc.tk")

      describe "Valid Data" do
        it "must be valid by @user default attributes" do
          @user.should be_valid
        end
      end

      describe "Username" do
        it "should be valid by a username format" do
          @user.username = "g5512345678"
          @user.should be_valid

          @user.username = "b5512345678"
          @user.should be_valid

          @user.username = "f5512345678"
          @user.should be_valid
        end

        it "should not be wrong username format" do
          @user.username = "abcgggg"
          @user.should_not be_valid
          @user.should have(1).error_on(:username)
        end

        it "should not be valid by a long username" do
          @user.username = "g12345678901"
          @user.should_not be_valid
          @user.should have(1).error_on(:username)
        end

        it "must not be valid from forget input username" do
          @user.username = ""
          @user.should_not be_valid
          @user.should have(1).error_on(:username)

          @user.username = nil
          @user.should_not be_valid
          @user.should have(1).error_on(:username)
        end
      end

      describe "Email" do
        it "can assign IP email address" do
          @user.email = "abc@127.0.0.1"
          @user.should be_valid
        end

        it "should not be invalid email" do
          @user.email = "abc@ks"
          @user.should_not be_valid
          @user.should have(1).error_on(:email)

          @user.email = "gg.ggg.com"
          @user.should_not be_valid
          @user.should have(1).error_on(:email)

          @user.email = "!~()@foo.bar.com"
          @user.should_not be_valid
          @user.should have(1).error_on(:email)

          @user.email = "123!@foo.bar.com"
          @user.should_not be_valid
          @user.should have(1).error_on(:email)

          @user.email = "123.456.789"
          @user.should_not be_valid
          @user.should have(1).error_on(:email)
        end
      end

      describe "Password Confirmation" do
        it "should not unequal with confirmation password" do
          @user.password_confirmation = '54321'
          @user.should_not be_valid
          @user.should have(1).error_on(:password_confimation)
        end

        it "should be valid by change unsame password to same password" do
          @user.password_confirmation = '54321'
          @user.password_confirmation = '12345'

          @user.should be_valid
        end

        it "should be valid from fancy password" do
          password = "?!(#*@)*!&*($*)"
          @user.password_confirmation = @user.password = password
          @user.should be_valid
        end
      end

      describe "Name" do
        it "should not be non-human name" do
          @user.name = 'abc2'
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)

          @user.name = '\#!/bin/'
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)
        end

        it "should not be blank" do
          @user.name = nil
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)

          @username.name = ''
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)
        end

        it "should not include a non-readable character" do
          @username.name = 'Somchai \nAry'
          @username.should_not be_valid
          @user.should have(1).error_on(:header_name)

          @username.name = ' '
          @username.should_not be_valid
          @user.should have(1).error_on(:header_name)
        end
      end

      describe "Lastname" do
        it "should not be non-human name" do
          @user.lastname = 'abc2'
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)

          @user.lastname = '\#!/bin/'
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)
        end

        it "should not be blank" do
          @user.lastname = nil
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)

          @username.lastname = ''
          @user.should_not be_valid
          @user.should have(1).error_on(:header_name)
        end

        it "should not include a non-readable character" do
          @username.lastname = 'Somchai \nAry'
          @username.should_not be_valid
          @user.should have(1).error_on(:header_name)

          @username.lastname = ' '
          @username.should_not be_valid
          @user.should have(1).error_on(:header_name)
        end
      end
    end
  end
end
