module Errors
  class InvalidProductCode < StandardError
    def initialize(msg = 'Invalid product code')
      super(msg)
    end
  end
end
