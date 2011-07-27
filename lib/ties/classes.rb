class TIES::Classes < TIES::Base
  def initialize(ties)
    @ties = ties
  end
  def get(page = 1, options = {})
    options.merge!({'SchoolYear' => Time.now.year})
    result = @ties.send_request('Schedule/Classes/%i' % page, options)
    return [] unless result
    self.total_pages = result['TotalPages']
    self.total_count = result['TotalCount']
    return result['Return']
  end
end