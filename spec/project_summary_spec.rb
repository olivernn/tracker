require 'spec_helper'

describe Tracker::ProjectSummary do
  let(:csv_path) { File.expand_path('../fixtures/tracking.csv', __FILE__) }
  let(:record_list) { Tracker::RecordList.new(csv_path) }

  describe "#lines" do
    let(:project_summary) { Tracker::ProjectSummary.new(record_list.to_a) }
    let(:lines) { project_summary.lines }
    subject { lines }

    its(:count) { should == 5 }

    context "names" do
      subject { lines.map(&:name) }
      it { should =~ %w(tracker truestory mandays hx website) }
    end

    context "values" do
      subject { lines.map(&:value) }
      it { should =~ [135, 210, 60, 15, 240] }
    end

    context "percentages" do
      subject { lines.map(&:percentage) }
      it { should =~ [135 / 660.0, 210 / 660.0, 60 / 660.0, 15 / 660.0, 240 / 660.0] }
    end
  end
end
