require 'spec_helper'

describe Tracker::RecordPresenter do
  describe "#as_csv" do
    let(:record) { double({
      category: 'DEV_SUPPORT',
      project: 'efg',
      duration: 90,
      description: 'some awesome project yo',
      created_at: Time.new(2013,1,1)
    })}

    let(:record_presenter) { Tracker::RecordPresenter.new(record) }

    subject { record_presenter.as_csv }

    it "should include the category" do
      subject[0].should == 'DEV_SUPPORT'
    end

    it "should include the project name" do
      subject[1].should == 'efg'
    end

    it "should include the duration" do
      subject[2].should == 90
    end

    it "should include the description" do
      subject[3].should == 'some awesome project yo'
    end

    it "should include the created_at" do
      subject[4].should == '2013-01-01'
    end
  end
end
