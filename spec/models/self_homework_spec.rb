require 'spec_helper'

describe SelfHomework do
    context "Association" do
    it { should belong_to :homework }
  end

end
