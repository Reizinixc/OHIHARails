require 'spec_helper'

describe Homework do
  context "Data Schema" do
    it { should have_db_column(:section_id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text)}
    it { should have_db_column(:start_time).of_type(:datetime) }
    it { should have_db_column(:due_time).of_type(:datetime) }
    it { should have_db_column(:type).of_type(:string) }
  end


  context "Association" do
    it { should belong_to :section }
  end

  context "Validation" do
    it { should validate_uniqueness_of :section_id }
    it { should validate_format_of(:section_id).with /[0-9]{3}/ }
    it { should validate_presence_of :section_id }
  end

  context "Add a section" do
    before(:each) do
      @section = Section.new(:section_id => "1",
                           :title => "Homework1",
                           :description => "This homework for test it.")
    end

    it "must be valid by a default attribute" do
      @section.should be_valid
    end

    describe "section" do
      it "should reject < 3 digits course code" do
        @section.section_id = "1"
        @section.should_not_valid
        @section.should have(1).error_on(:section_id)
      end

      it "should reject > 3 digit course code" do
        @section.section_id = "5103"
        @section.should_not_valid
        @section.should have(1).error_on(:section_id)
      end

      it "should reject not integer" do
        @section.section_id = "a1234"
        @section.should_not_valid
        @section.should have(1).error_on(:section_id)
      end
    end
  end
end

