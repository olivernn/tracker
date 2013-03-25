require 'spec_helper'

describe Tracker::LineParser do
  describe "#parse" do
    let(:line_parser) { Tracker::LineParser.new(line) }
    subject { line_parser.parse }

    context "category and duration only" do
      let(:line) { "DEV_SUPPORT 1h30m" }

      it "should extract the category" do
        subject[:category].should == 'DEV_SUPPORT'
      end

      it "should extract the hours" do
        subject[:hours].should == 1
      end

      it "should extract the minutes" do
        subject[:minutes].should == 30
      end

      it "should not have a project" do
        subject.has_key?(:project).should be_false
      end

      it "should not have a description" do
        subject.has_key?(:description).should be_false
      end
    end

    context "category, project and duration" do
      let(:line) { "DEV_SUPPORT #efg 1h30m" }

      it "should extract the category" do
        subject[:category].should == 'DEV_SUPPORT'
      end

      it "should extract the hours" do
        subject[:hours].should == 1
      end

      it "should extract the minutes" do
        subject[:minutes].should == 30
      end

      it "should extract the project" do
        subject[:project].should == 'efg'
      end

      it "should not have a description" do
        subject.has_key?(:description).should be_false
      end
    end

    context "category, project, duration and description" do
      let(:line) { "DEV_SUPPORT #efg 1h30m | this is a description" }

      it "should extract the category" do
        subject[:category].should == 'DEV_SUPPORT'
      end

      it "should extract the hours" do
        subject[:hours].should == 1
      end

      it "should extract the minutes" do
        subject[:minutes].should == 30
      end

      it "should extract the project" do
        subject[:project].should == 'efg'
      end

      it "should have a description" do
        subject[:description].should == 'this is a description'
      end
    end

    context "duration has minutes only" do
      let(:line) { "DEV_SUPPORT #efg 30m | this is a description" }

      it "should extract the hours" do
        subject[:hours].should == 0
      end

      it "should extract the minutes" do
        subject[:minutes].should == 30
      end
    end

    context "duration has hours only" do
      let(:line) { "DEV_SUPPORT #efg 1h | this is a description" }

      it "should extract the hours" do
        subject[:hours].should == 1
      end

      it "should extract the minutes" do
        subject[:minutes].should == 0
      end
    end
  end
end 
