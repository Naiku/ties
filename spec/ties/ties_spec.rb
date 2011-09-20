require File.dirname(__FILE__) + '/../spec_helper'

describe TIES do
  it "should have default endpoint" do
    TIES::ENDPOINT.should == 'https://api.tiescloud.net/v1.0'
  end
end