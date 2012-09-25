require 'spec_helper'

describe Item do
  context "Data Schema" do
    it { should have_db_column(:question).of_type(:text) }
    it {should have_db_column(:question_homework_id).of_type(:integer)}

  end

  context "Association" do
    it { should belong_to : question_answers}
  end

  context "Validation" do
    it { should validate_uniqueness_of :question_homework_id }
    it { should validate_format_of(:section_id).with /[0-9]/ }
    it { should validate_presence_of :question_homework_id }
  end

  context "Add a item" do
    before(:each) do
      @item = Item.new(:question_homework_id => "100",
                             :question => "How to test?")

    end

    it "must be valid by a default attribute" do
      @item.should be_valid
    end

    describe "item" do
      it "question homework should digit" do
        @item.question_homework_id = "aa"
        @item.should_not_valid
        @item.should have(1).error_on(:question_homework_id)
      end

    end
  end
end
