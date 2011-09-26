require 'net/https'
require 'openssl'
require 'base64'
require 'cgi'
require 'uri'
require 'json'

module TIES
  ENDPOINT = 'https://api.tiescloud.net/v1.0'
  VERSION = '0.2'
  def self.new(*options)
    TIES::Base.new(*options)
  end
end

require 'ties/base'
require 'ties/schools'
require 'ties/students'
require 'ties/teachers'
require 'ties/schedule'
require 'ties/my_view'
