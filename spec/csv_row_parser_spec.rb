require 'spec_helper'

describe Tracker::CSVRowParser do
  describe "#parse" do
    subject { Tracker::CSVRowParser.new(row).parse }

    context "with project" do
      let(:row) { ['category', 'project', '60', 'description', '2013-01-01'] }
      its([:category]) { should == 'category' }
      its([:project]) { should == 'project' }
      its([:minutes]) { should == 60 }
      its([:description]) { should == 'description' }
      its([:created_at]) { should == Time.parse('2013-01-01') }
    end

    context "without project" do
      let(:row) { ['category', nil, '60', 'description', '2013-01-01'] }

      it { should_not have_key(:project) }

      its([:category]) { should == 'category' }
      its([:minutes]) { should == 60 }
      its([:description]) { should == 'description' }
      its([:created_at]) { should == Time.parse('2013-01-01') }
    end
  end
end
