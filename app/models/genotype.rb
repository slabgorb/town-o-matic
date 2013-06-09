class Genotype
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  embedded_in :being
  field :genes, type: Array, default:[]
  index({ genes: 1 })

  #
  # Compare operator - compare the base 10 values
  # @see value
  # @param other Genotype
  def <=>(other)
    other.to_i <=> to_i
  end

  def to_s
    genes.join
  end

  def to_a
    genes
  end

  # sort the genes by the base10 value of the hex number
  def sort
    genes.sort { |a,b| a.to_i(16) <=> b.to_i(16) }
  end

  # return the sum of the base10 values of the genes
  def to_i(index)
    inject(0){ |memo, gene| memo += gene.to_i(16)}
  end

  # creates a random set of genes
  def randomize!(genecount = 100)
    update_attribute(genes, Array(1..genecount).map { Genotype.rand_hex  })
  end

  # proxy to the genes array
  def method_missing(meth, *args, &block)
    genes.send(meth, *args, &block)
  end

  # gene at the supplied index value
  # TODO: figure out why this is not proxying
  def [](index)
    genes[index]
  end

  #
  # Exchange genetic material with another chromosome. The strategy is
  # to loop through the gene arrays of this and the other chromosome
  # and randomly exchange at the gene level
  #
  def reproduce_with(other)
    c = Genotype.new
    length.times do |i|
      c  << ((rand > 0.5) ? self[i] : other[i])
    end
    c
  end

  #
  # Change one of the genes to a random value.
  #
  def mutate
    index = (rand * length).floor
    genes[index] = Genotype.rand_hex
  end

  #
  # generates a six digit hex number as a string
  #
  def self.rand_hex
    ("%06x" % (rand * 16777215).floor).upcase
  end

  def walk
    genes.each do |gene|
      yield gene
    end
  end


end


