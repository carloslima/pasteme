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

  it "ensures the preview's last line is never empty" do
    # <pre> blocks wont show the last line if it's empty, making the
    # line numbering and code block get out of sync (one extra line number)
    # So, if the code has an "empty" line at the end, we add a space to it
    # to make sure it displays correctly.
    Factory.build(:snippet, :code=>"first"+"\n"*30+"last").preview.code.to_a.last.should_not be_empty
  end

end
