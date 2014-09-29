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

    def remove!(inhabitant)
      self.inhabitants.delete(inhabitant)
    end

    def to_s
      self.name
    end

  end

  class Area
    def initialize(name, ruler = nil)
      @name = name
      @inhabitants = []
      @ruler = ruler
    end
  end

  class Dwelling < Area
    include Habitation
    attr_accessor :inhabitants, :name, :location
    def initialize(name, head_of_household = nil)
      @location = nil
      super
    end

    def to_s
      s = name
      if @location
        s += " in #{@location}"
      end
    end

  end

  class Nation < Area
    include Habitation
    attr_accessor :inhabitants, :name, :ruler
    def initialize(name, ruler=nil)
      super
    end
  end

  class Town < Area
    include Habitation
    attr_accessor :inhabitants, :name, :ruler, :dwellings, :graveyard, :location
    def initialize(name, ruler = nil, nation = nil)
      super(name, ruler)
      @graveyard = []
      @dwellings = []
      @location = nation
    end

    def ruler
      @ruler.alive? ? @ruler : nil
    end

    def add(habitation)
      @dwellings << habitation
      habitation.location = self
      @inhabitants += habitation.inhabitants
      @location.inhabitants += habitation.inhabitants if @location
      @inhabitants.each do  |i|
        i.habitations << self
        @location.inhabitants << self if @location
      end
    end

    def <<(habitation)
      add(habitation)
    end

    def bury(dead)
      @graveyard << dead
    end

  end

end

