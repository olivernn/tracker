require 'spec_helper'

describe Tracker::CategorySummary do
  let(:csv_path) { File.expand_path('../fixtures/tracking.csv', __FILE__) }
  let(:record_list) { Tracker::RecordList.new(csv_path) }

  describe "#lines" do
    let(:category_summary) { Tracker::CategorySummary.new(record_list.to_a) }
    let(:lines) { category_summary.lines }
    subject { lines }

    its(:count) { should == 3 }

    context "names" do
      subject { lines.map(&:name) }
      it { should =~ %w(batman_tools client_support internal_apps_support) }
    end

    context "values" do
      subject { lines.map(&:value) }
      it { should =~ [135, 510, 15] }
    end

    context "percentages" do
      subject { lines.map(&:percentage) }
      it { should =~ [135 / 660.0, 510 / 660.0, 15 / 660.0] }
    end
  end
end
