require "spec_helper"

describe HomeworkAnswerFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/homework_answer_files").should route_to("homework_answer_files#index")
    end

    it "routes to #new" do
      get("/homework_answer_files/new").should route_to("homework_answer_files#new")
    end

    it "routes to #show" do
      get("/homework_answer_files/1").should route_to("homework_answer_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/homework_answer_files/1/edit").should route_to("homework_answer_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/homework_answer_files").should route_to("homework_answer_files#create")
    end

    it "routes to #update" do
      put("/homework_answer_files/1").should route_to("homework_answer_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/homework_answer_files/1").should route_to("homework_answer_files#destroy", :id => "1")
    end

  end
end
