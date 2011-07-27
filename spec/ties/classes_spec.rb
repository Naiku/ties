require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::Classes do
  it "should be classes object" do
    ties.classes.should be_a(TIES::Classes)
  end
  it "should retrieve classes" do
    classes = ties.classes
    result = classes.get(1, "SchoolId" => "0121", "SchoolYear" => "2010")
    result.should_not be_empty
    result.should be_a(Array)
    classes.total_pages.should_not be_nil
    classes.total_count.should_not be_nil
  end
end