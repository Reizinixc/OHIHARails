require 'spec_helper'

describe Section do

  context "Database Schema" do
    it { should have_db_colomn(:course_id).of_type(:integer) }
    it { should have_db_colomn(:section).of_type(:integer) }
    it { should have_db_colomn(:semester).of_type(:integer) }
    it { should have_db_colomn(:year).of_type(:string) }
    it { should have_db_colomn(:is_suspend).of_type(:boolean) }
  end

  context "Association" do
    it { should belong_to :courses }
    it { should have_many(:users).through :tas }
    it { should have_many(:users).through :takes }
    it { should have_many(:users).through :teaches }
  end

  context "Validations" do
    it { should validate_presence_of :course_id }
    it { should validate_presence_of :section }
    it { should validate_presence_of :semester }
    it { should validate_presence_of :year }
    it { should validate_presence_of :is_suspend }

    it { should validate_format_of(:year).with /[0-9]{1,4}/ }
  end

  context "Create new Section" do
    before(:each) do
      #@course = Course.new ({:course_id          => "01123456",
      #                      :thai_course_name    => "123",
      #                      :english_course_name => "Hybrid Fork Study"})
      #@course.save

      @section = Section.new ({:course_id  => @course.id,
                              :section    => 1,
                              :semester   => 1,
                              :year       => "2012",
                              :is_suspend => false})
    end

    after(:each) do
      @course.destroy
    end

    it "should be valid from default attribute" do
      @section.should be_valid
    end

    context "Course ID" do
      @section.course_id = "01111111"
      @section.should_not be_valid
      @section.should have(1).error_on(:course_id)
    end

  end
end
