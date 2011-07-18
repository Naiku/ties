require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::Schools do

  it "should be schools object" do
    ties.schools.should be_a(TIES::Schools)
  end
  it "retrieve schools" do
    ties.schools.get.inspect
  end
end