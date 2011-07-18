require File.dirname(__FILE__) + '/../spec_helper'

describe TIES do
  it "should have default endpoint" do
    TIES::TEST_ENDPOINT.should == 'https://apitest.tiescloud.net/v1.0/'
  end
  describe TIES::Base do
    describe ".new" do
      it "should initialize" do
        ties.should be_a(TIES::Base)
      end
      it "should have endpoint" do
        ties.endpoint.should == TIES::TEST_ENDPOINT
      end
    end
  end
end