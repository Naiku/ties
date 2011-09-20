require 'rubygems'
gem 'rspec'
 
$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'ties'

module TiesHelper
  def ties
    TIES.new("api_key" => "4a29d0e61cd0", "secret_key" => "4a29d0e61cd047d78f233ea99f62a3b3", "endpoint" => 'https://apitest.tiescloud.net/v1.0', "district_number" => '8999')
  end
end

RSpec.configure do |c|
  c.include TiesHelper
end
