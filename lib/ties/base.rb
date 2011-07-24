
class TIES::Base
  attr_accessor :api_key, :secret_key, :endpoint, :district_number

  # options should contain
  #   :api_key
  #   :secret_key
  #   :district_number
  def initialize(options)
    self.api_key, self.secret_key = options["api_key"], options["secret_key"]
    self.district_number = options["district_number"]
    self.endpoint = options["endpoint"] || TIES::TEST_ENDPOINT
  end

  def send_request(uri, options = {})
    if self.api_key.nil? || self.secret_key.nil? || self.district_number.nil?
      raise 'not enough data to send request'
    end
    result = request_over_http(options, endpoint, uri)
    if !result
      raise 'Request to TIES api "%s" failed' % uri
    end
    case result.code.to_i
    when 400
      return false
    when 200
      return JSON.parse(result.body)
    else
      raise 'unknown error status code %s for uri "%s"' % [result.code, uri]
    end
  end

  def authentication(http_method, time, request_uri)
    data = [http_method, time, request_uri].join('\n')
    'TIES ' + [api_key, Base64.encode64(OpenSSL::HMAC.digest('sha1', self.secret_key, data))].join(':')
  end

  def schools(); @schools ||= TIES::Schools.new(self); end
  def reimbursements(); @reimbursements ||= TIES::MyView::Reimbursements.new(self); end

  protected

  # For easier testing. You can mock this method with a XML file you're expecting to receive
  def request_over_http(options, endpoint, uri)
    uri = URI.parse([endpoint, uri].join('/'))

    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    http.set_debug_output $stderr
    request = Net::HTTP::Get.new(uri.request_uri)
    request.initialize_http_header({
      'User-Agent' => 'TIEScloud ruby gem',
      'ties-date' => (time = Time.now).utc.to_s,
      'Authorization' => authentication('GET', time, uri.request_uri),
      'DistrictNumber' => self.district_number.to_s
    })
    http.request(request)
  end
end
