require 'spec_helper'

describe QuestionAnswer do
  context "Data Schema" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:item_id).of_type(:integer) }
    it { should have_db_column(:ip).of_type(:string) }
    it { should have_db_column(:score).of_type(:int) }
    it { should have_db_column(:reason).of_type(:string) }
    it { should have_db_column(:answer).of_type(:text) }

  end


  context "Association" do
    it { should belong_to :item }
  end

  context "Validation" do
    it { should validate_uniqueness_of :item_id }
    it { should validate_format_of(:item_id).with /[0-9]/ }
    it { should validate_presence_of :item_id }
    it { should validate_uniqueness_of :user_id }
    it { should validate_format_of(:ip).with /[0-9]{:3}.[0-9]{:3}.[0-9]{:3}.[0-9]{:3}/ }
    it { should validate_presence_of :user_id }
  end

  context "Add a question answer" do
    before(:each) do
      @question = QuestionAnswer.new(:item_id => "12",
                                     :item_id => "3",
                                     :ip      => "158.108.12.32",
                                     :score   => "12",
                                     :reason  => "you best",
                                     :answer  => "I'm right.")
    end

    it "must be valid by a default attribute" do
      @question.should be_valid
    end

    describe "question_answer" do
      it "should be digits course code" do
        @question.course_id = "asdk"
        @question.should_not_valid
        @question.should have(1).error_on(:question_id)
      end

      it "not is ip should xxx.xxx.xxx.xxx x is digit." do
        @section.ip = "xxx.123.321.132"
        @section.should_not_valid
        @section.should have(1).error_on(:ip)
      end
    end
  end
end
