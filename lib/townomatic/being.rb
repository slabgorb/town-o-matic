module Townomatic
  class Being
    attr_accessor :names
    def initialize(names = { })
      @names = names
    end

    def to_s
      @names.values.join()
    end
  end
end
