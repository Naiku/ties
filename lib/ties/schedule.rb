class TIES::Schedule 
  class Classes < TIES::Base
    def initialize(ties)
      @ties = ties
    end
    def get(page = 1, options = {})
      result = @ties.send_request('Schedule/Classes/%i' % page, options)
      return [] unless result
      self.total_pages = result['TotalPages']
      self.total_count = result['TotalCount']
      return result['Return']
    end
  end
  class RequestedClasses < TIES::Base
    def initialize(ties)
      @ties = ties
    end
    def get(page = 1, options = {})
      raise 'Missing student id' if options["StudentId"].nil?
      options.merge!({'IsScheduled' => 'true'})
      result = @ties.send_request('Schedule/RequestedClasses/%i' % page, options)
      return [] unless result
      self.total_pages = result['TotalPages']
      self.total_count = result['TotalCount']
      return result['Return']
    end
  end
end