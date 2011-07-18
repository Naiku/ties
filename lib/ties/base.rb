require 'openssl'
require 'base64'
require 'cgi'


module TIES
  TEST_ENDPOINT = 'https://apitest.tiescloud.net/'
  def self.new(*options)
    TIES::Base.new(*options)
  end
  class Base
    attr_accessor :api_key, :secret_key, :endpoint

    def initialize(options)
      self.api_key, self.secret_key = options[:api_key], options[:secret_key]
      self.endpoint = options[:endpoint] || TIES::TEST_ENDPOINT
    end

    def send_request(method, options)
      options.merge!([:method => method])
      sign_request!(options)
    end

    def sign_request!(options)
      options[:api_key] = self.api_key
      options[:api_sig] = Base64.encode64(OpenSSL::HMAC.digest('sha1', self.secret_key, options.to_a.sort_by{|k| k[0].to_s}.flatten.join))
    end

    def schools(); @schools ||= TIES::Schools.new(self); end

    protected

    # For easier testing. You can mock this method with a XML file you're expecting to receive
    def request_over_http(options, http_method, endpoint)
      if http_method == :get
        api_call = endpoint + "?" + options.collect{|k,v| "#{k}=#{CGI.escape(v.to_s)}"}.join('&')
        Net::HTTP.get(URI.parse(api_call))
      else
        Net::HTTP.post_form(URI.parse(endpoint), options).body
      end
    end
  end
end