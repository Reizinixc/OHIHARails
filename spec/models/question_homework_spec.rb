require 'spec_helper'

describe QuestionHomework do
  context "Association" do
    it { should belong_to :homework }
    it { should have_many :item }
  end
end
