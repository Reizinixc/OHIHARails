require 'spec_helper'

describe "SelfHomeworkAnswerFiles" do
  describe "GET /self_homework_answer_files" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get self_homework_answer_files_path
      response.status.should be(200)
    end
  end
end