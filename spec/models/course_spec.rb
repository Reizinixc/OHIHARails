require 'spec_helper'

describe Course do

  context "Data Schema" do
    it { should have_db_column(:course_code).of_type(:string) }
    it { should have_db_column(:thai_course_name).of_type(:string) }
    it { should have_db_column(:english_course_name).of_type(:string) }
    it { should have_db_column(:updated_by).of_type(:string) }
  end

  context "Association" do
    pending "Test when Section model generated"
  end

  context "Validation" do
    it { should validate_uniqueness_of :course_code }
    it { should validate_format_of(:course_code).with /[0-9]{8}/ }

    it { should validate_presence_of :course_code }
  end

  context "Add a course" do
    before(:each) do
      @course = Course.new(:course_code => "01015113",
                           :thai_course_name => "123 III",
                           :english_course_name => "Insei Study III")
    end

    it "must be valid by a default attribute" do
      @course.should be_valid
    end

    describe "Course Code" do
      it "should reject < 8 chars course code" do
        @course.course_code = "0101513"
        @course.should_not be_valid
        @course.should have(1).error_on(:course_code)
      end

      it "should reject > 8 chars course code" do
        @course.course_code = "010151311"
        @course.should_not be_valid
        @course.should have(1).error_on(:course_code)
      end

      it "should reject non-digit course code" do
        @course.course_code = "a1234567"
        @course.should_not be_valid
        @course.should have(1).error_on(:course_code)
      end
    end
  end

end
