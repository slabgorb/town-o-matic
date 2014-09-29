module Townomatic
  class Being
    attr_accessor :names, :habitations
    def initialize(names = { })
      @names = names
      @habitations = []
      @living = true
    end

    def die!
      @living = false
      @habitations.each do |habitation|
        habitation.bury(self) if habitation.respond_to?(:bury)
        habitation.remove!(self)
      end
    end

    def alive?
      @living
    end

    def to_s
      @names.values.join()
    end
  end
end
