require 'net/https'
require 'openssl'
require 'base64'
require 'cgi'
require 'uri'
require 'json'

module TIES
  TEST_ENDPOINT = 'https://apitest.tiescloud.net/v1.0'
  def self.new(*options)
    TIES::Base.new(*options)
  end
end

require 'ties/base'
require 'ties/schools'
require 'ties/my_view'
