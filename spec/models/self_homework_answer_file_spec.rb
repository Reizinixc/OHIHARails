require 'spec_helper'

describe SelfHomeworkAnswerFile do

  context "Database Schema" do
    it { should have_db_colomn (:user_id).of_type(:integer) }
    it { should have_db_colomn (:self_homework_id).of_type(:integer) }
    it { should have_db_colomn (:ip).of_type(:string) }
    it { should have_db_colomn (:score).of_type(:integer) }
    it { should have_db_colomn (:reason).of_type(:string) }
    it { should have_db_colomn (:description).of_type(:text) }
    it { should have_db_colomn (:file).of_type(:attachment) }
  end

  context "Association" do
    it { should belong_to :SelfHomework }
  end

  context "Validations" do
    it { should validate_presence_of :user_id }
    it { should validate_uniqueness_of :self_homework_id }
    it { should validate_format_of(:self_homework_id).with /[0-9]/ }
    it { should validate_presence_of :self_homework_id }
    it { should validate_presence_of :ip.with /[0-9]{:3}.[0-9]{:3}.[0-9]{:3}.[0-9]{:3}/}
    it { should validate_presence_of :score }
    it { should validate_presence_of :reason }

    it { should validate_format_of(:year).with /[0-9]{1,4}/ }
  end

  context "Create new Self homework answer" do
    before(:each) do
      #@course = Course.new ({:course_id          => "01123456",
      #                      :thai_course_name    => "123",
      #                      :english_course_name => "Hybrid Fork Study"})
      #@course.save

      @selfAnswer = SelfHomeworkAnswerFile.new (:user_id  => @course.id,
                               :self_homework_id    => "3",
                               :ip  => "158.108.12.41",
                               :score  => "3",
                               :reason => "",
                               :description => "This is test description.")
    end

    after(:each) do
      @selfAnswer.destroy
    end

    it "should be valid from default attribute" do
      @selfAnswer.should be_valid
    end

    #context "Course ID" do
    #  @section.course_id = "01111111"
    #  @section.should_not be_valid
    #  @section.should have(1).error_on(:course_id)
    #end

    it "should be ip format xxx.xxx.xxx.xxx ,x is digit 0-9" do
      @selfAnswer.ip= "189.23.aa.22"
      @selfAnswer.should_not be_valid
      @selfAnswer.should have(1).error_on(:ip)
    end

  end
end
