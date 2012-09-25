require 'spec_helper'

describe Teach do
  context "Database Schema" do
    it { should have_db_colomn (:user_id).of_type(:integer) }
    it { should have_db_colomn (:section_id).of_type(:integer) }
  end

  context "Association" do
    it { should belong_to :user }
    it { should belong_to :seciton }
  end
end
