require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::Schools do

  it "should be schools object" do
    ties.schools.should be_a(TIES::Schools)
  end
  it "should retrieve schools" do
    schools = ties.schools
    result = schools.get()
    result.should_not be_empty
    result.should be_a(Array)
    schools.total_pages.should_not be_nil
    schools.total_count.should_not be_nil
  end
end