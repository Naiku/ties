class TIES::Schools < TIES::Base
  attr_accessor :total_pages, :total_count
  def initialize(ties)
    @ties = ties
  end
  def get(page = 1, options = {})
    result = @ties.send_request('Schools/%i' % page, options)
    return [] unless result
    self.total_pages = result['TotalPages']
    self.total_count = result['TotalCount']
    return result['Return']
  end
  def all(options = {})
    @schools = []
    page = 1
    begin
      @schools << self.get(page, options)
      page += 1
    end until self.total_pages <= page
    @schools
  end
end