require 'spec_helper'

describe Snippet do
  it "should create a new instance given valid attributes" do
    Factory(:snippet).should be_valid
  end

  it "requires a valid language" do
    Factory.build(:snippet, :language=>nil).should_not be_valid
    Factory.build(:snippet, :language_id=>nil).should_not be_valid
    Factory.build(:snippet, :language_id=>"").should_not be_valid
    Factory.build(:snippet, :language_id=>99).should_not be_valid 
  end

  it "requires non-empty code" do
    Factory.build(:snippet, :code=>"").should_not be_valid
    Factory.build(:snippet, :code=>" ").should_not be_valid
    Factory.build(:snippet, :code=>nil).should_not be_valid
  end
end
