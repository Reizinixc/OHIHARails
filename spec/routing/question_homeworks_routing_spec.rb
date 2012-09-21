require "spec_helper"

describe QuestionHomeworksController do
  describe "routing" do

    it "routes to #index" do
      get("/question_homeworks").should route_to("question_homeworks#index")
    end

    it "routes to #new" do
      get("/question_homeworks/new").should route_to("question_homeworks#new")
    end

    it "routes to #show" do
      get("/question_homeworks/1").should route_to("question_homeworks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_homeworks/1/edit").should route_to("question_homeworks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_homeworks").should route_to("question_homeworks#create")
    end

    it "routes to #update" do
      put("/question_homeworks/1").should route_to("question_homeworks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_homeworks/1").should route_to("question_homeworks#destroy", :id => "1")
    end

  end
end
