require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UserSessionsController do

  # This should return the minimal set of attributes required to create a valid
  # UserSession. As you add validations to UserSession, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
        :username => 'bTest',
        :password => '12345'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UserSessionsController. Be sure to keep this updated too.
  def valid_session
    { }
  end

  describe "GET new" do
    it "assigns a new user_session as @user_session" do
      get :new, { }, valid_session
      assigns(:user_session).should be_a_new(UserSession)
    end
  end

  describe "POST create" do
    describe "with valid params" do

    end
    describe "with invalid params" do

    end

  end


  describe "DELETE destroy" do

  end
end
