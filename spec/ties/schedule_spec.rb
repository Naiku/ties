require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::Schedule::Classes do
  it "should be classes object" do
    ties.classes.should be_a(TIES::Schedule::Classes)
  end
  it "should retrieve classes" do
    classes = ties.classes
    result = classes.get(1, {SchoolYear: "2010", StudentId: "2010"})
    result.should_not be_empty
    result.should be_a(Array)
    classes.total_pages.should_not be_nil
    classes.total_count.should_not be_nil
  end
end
describe TIES::Schedule::RequestedClasses do
  it "should be a RequestedClasses object" do
    ties.requested_classes.should be_a(TIES::Schedule::RequestedClasses)
  end
  it "should require StudentId" do
    ties.requested_classes.get(1, 'SchoolYear' => '2010')
  end
  it "retrieve requested classes" do
    classes = ties.requested_classes.get(1, 'StudentId' => '698090', 'SchoolYear' => '2010')
    classes.should be_a(Array)
    classes.should_not be_empty
  end
end
