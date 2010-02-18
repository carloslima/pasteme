require 'spec_helper'

describe Language do
  it "should create a new instance given valid attributes" do
    Factory(:language)
  end

  it "should have a name" do
    Factory.build(:language, :name=>nil).should_not be_valid
    Factory.build(:language, :name=>"").should_not be_valid
  end
  it "should have a parser" do
    Factory.build(:language, :parser=>nil).should_not be_valid
    Factory.build(:language, :parser=>"").should_not be_valid
  end

end
