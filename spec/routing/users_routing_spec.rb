require "spec_helper"

describe UsersController do

  context "routing" do

    describe "User's List" do
      it "should route to User's List" do
        get("/users").should route_to("users#index")
      end

      it "should route to User's Profile" do
        get("/user/gHarasama").should route_to("users#show", :username => "gHarasama")
      end

      it "should route to Login Page" do
        get("/login").should route_to("user_sessions#new")
      end

      it "should route to Login Page" do
        get("/logout").should route_to("user_sessions#destroy")
      end

      it "should route to Edit Profile Page" do
        get("/settings").should route_to("users#edit")
      end
    end

  end
end
