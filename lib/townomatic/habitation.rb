module Townomatic

  module Habitation
    def add(inhabitant)
      self.inhabitants << inhabitant
    end

    def <<(inhabitant)
      add(inhabitant)
      inhabitant.habitations << self
    end

    def population
      self.inhabitants.count
    end

  end

  class Dwelling
    include Habitation
    attr_accessor :inhabitants, :name
    def initialize(name)
      @name = name
      @inhabitants = []
    end

    def to_s
      @name
    end

  end

  class Town
    include Habitation
    attr_accessor :inhabitants, :name, :ruler
    def initialize(name, ruler = nil)
      @name = name
      @inhabitants = []
      @inhabitants << ruler if ruler
      @ruler = ruler

    end


  end

end

