require 'spec_helper'

describe Snippet do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :language_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Snippet.create!(@valid_attributes)
  end
end
