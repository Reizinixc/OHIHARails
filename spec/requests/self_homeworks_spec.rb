require 'spec_helper'

describe "SelfHomeworks" do
  describe "GET /self_homeworks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get self_homeworks_path
      response.status.should be(200)
    end
  end
end
