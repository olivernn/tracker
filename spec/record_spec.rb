require 'spec_helper'

describe Tracker::Record do
  describe "#initialize" do
    let(:attributes) { {
      category: 'DEV_SUPPORT',
      hours: 1,
      minutes: 30,
      project: 'efg',
      description: 'lots of jolly good work'
    } }

    subject { Tracker::Record.new(attributes) }

    its(:category) { should == 'DEV_SUPPORT' }
    its(:duration) { should == 90 }
    its(:project) { should == 'efg' }
    its(:description) { should == 'lots of jolly good work' }
    its(:created_at) { should_not be_nil }
  end
end 
