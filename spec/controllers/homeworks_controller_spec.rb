require 'spec_helper'

describe HomeworksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'handin'" do
    it "returns http success" do
      get 'handin'
      response.should be_success
    end
  end

  describe "GET 'download'" do
    it "returns http success" do
      get 'download'
      response.should be_success
    end
  end

end
