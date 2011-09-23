class TIES::Schools < TIES::Base
  def initialize(ties)
    @ties = ties
  end
  def get(page = 1, options = {})
    options.merge!({"DistrictNumber" => @ties.district_number})
    result = @ties.send_request('Schools/%i' % page, options)
    return [] unless result
    self.total_pages = result['TotalPages']
    self.total_count = result['TotalCount']
    return result['Return']
  end
end