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

  describe "#valid?" do
    subject { Tracker::Record.new(attributes) }

    let(:valid_attributes) { {
      category: 'DEV_SUPPORT',
      hours: 1,
      minutes: 30,
      project: 'efg',
      description: 'lots of jolly good work'
    } }

    context "with valid attributes" do
      let(:attributes) { valid_attributes }
      it { should be_valid }
    end

    context "wihtout a category" do
      let(:attributes) { valid_attributes.merge(category: '') }
      it { should_not be_valid }
    end

    context "without an empty duration" do
      let(:attributes) { valid_attributes.merge(hours: 0, minutes: 0) }
      it { should_not be_valid }
    end
  end
end 
