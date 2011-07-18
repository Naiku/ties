require 'rubygems'
gem 'rspec'
 
$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'ties'

module TiesHelper
  def ties
    TIES.new(:api_key => "api_key", :secret_key => "secret_key")
  end
end

RSpec.configure do |c|
  c.include TiesHelper
end
