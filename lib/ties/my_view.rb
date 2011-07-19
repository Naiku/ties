class TIES::MyView
  class Reimbursements < TIES::Base
    def initialize(ties)
      @ties = ties
    end
    def get(page = 1, options = {})
      @ties.send_request('MyView/Reimbursements/Page=%i' % page, options)
    end
  end
end