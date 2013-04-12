require 'spec_helper'

describe Tracker::RecordList do
  let(:csv_path) { File.expand_path('../fixtures/tracking.csv', __FILE__) }
  describe "#initialize" do
    subject { Tracker::RecordList.new(csv_path) }
    its(:count) { should == 8 }
  end

  describe "#projects" do
    subject { Tracker::RecordList.new(csv_path).projects }

    its(:count) { should == 5 }
    it { should == %w(tracker truestory mandays hx website) }
  end

  describe "#<<" do
    subject { Tracker::RecordList.new(csv_path) }
    let(:record) { Tracker::Record.new(category: 'foo', project: 'foo') }

    before { CSV.any_instance.should_receive(:<<).and_return(true) }

    it "should add a new record to the list" do
      expect {
        subject << record
      }.to change(subject, :count).by(1)
    end

    it "should include the new records project in list of projects" do
      subject << record
      subject.projects.should include('foo')
    end
  end
end
