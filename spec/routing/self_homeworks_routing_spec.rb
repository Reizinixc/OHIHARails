require "spec_helper"

describe SelfHomeworksController do
  describe "routing" do

    it "routes to #index" do
      get("/self_homeworks").should route_to("self_homeworks#index")
    end

    it "routes to #new" do
      get("/self_homeworks/new").should route_to("self_homeworks#new")
    end

    it "routes to #show" do
      get("/self_homeworks/1").should route_to("self_homeworks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/self_homeworks/1/edit").should route_to("self_homeworks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/self_homeworks").should route_to("self_homeworks#create")
    end

    it "routes to #update" do
      put("/self_homeworks/1").should route_to("self_homeworks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/self_homeworks/1").should route_to("self_homeworks#destroy", :id => "1")
    end

  end
end
