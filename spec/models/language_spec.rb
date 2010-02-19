require 'spec_helper'

describe Language do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :parser => "value for parser"
    }
  end

  it "should create a new instance given valid attributes" do
    Language.create!(@valid_attributes)
  end
end
