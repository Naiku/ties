require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::Base do
  describe ".new" do
    it "should initialize" do
      ties.should be_a(TIES::Base)
    end
    it "should have default endpoint" do
      TIES.new({}).endpoint.should == TIES::ENDPOINT
    end
  end
end