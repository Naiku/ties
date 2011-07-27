require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::Students do
  it "should be students object" do
    ties.students.should be_a(TIES::Students)
  end
  it "should retrieve students" do
    students = ties.students
    result = students.get(1, "SchoolId" => "0121", "SchoolYear" => "2010")
    result.should_not be_empty
    result.should be_a(Array)
    students.total_pages.should_not be_nil
    students.total_count.should_not be_nil
  end
end