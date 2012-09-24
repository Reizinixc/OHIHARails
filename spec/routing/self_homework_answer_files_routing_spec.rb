require "spec_helper"

describe SelfHomeworkAnswerFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/self_homework_answer_files").should route_to("self_homework_answer_files#index")
    end

    it "routes to #new" do
      get("/self_homework_answer_files/new").should route_to("self_homework_answer_files#new")
    end

    it "routes to #show" do
      get("/self_homework_answer_files/1").should route_to("self_homework_answer_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/self_homework_answer_files/1/edit").should route_to("self_homework_answer_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/self_homework_answer_files").should route_to("self_homework_answer_files#create")
    end

    it "routes to #update" do
      put("/self_homework_answer_files/1").should route_to("self_homework_answer_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/self_homework_answer_files/1").should route_to("self_homework_answer_files#destroy", :id => "1")
    end

  end
end
