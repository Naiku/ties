require File.dirname(__FILE__) + '/../spec_helper'

describe TIES do
  it "should have default endpoint" do
    TIES::TEST_ENDPOINT.should == 'https://apitest.tiescloud.net/v1.0'
  end
end