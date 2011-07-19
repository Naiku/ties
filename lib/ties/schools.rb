class TIES::Schools < TIES::Base
  def initialize(ties)
    @ties = ties
  end
  def get(page = 1, options = {})
    @ties.send_request('Schools/Page=%i' % page, options)
  end
end