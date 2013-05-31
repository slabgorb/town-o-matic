class Phenotype
  include Mongoid::Document
  field :name, :type => String
  field :morphology_expression, :type => Hash, default: { }
  field :development_expression, :type => Hash, default: { }
  field :behavior_expression, :type => Hash, default: { }

  def express(expression, genotype, &block)
    send("#{expression}_expression").each_pair do |category, value_set|
      value_set.each_pair do |key, marker|
        matches = marker.map{ |m| genotype.to_s.scan(/#{m}/) }.sum
        yield category, key, matches
      end
    end
  end


  def scan(genotype, expression)
    genotype.genes.join.scan(/#{expression}/).sum
  end

  def expression(genes)
    results = Hash.new()
    [:development, :behavior, :morphology].each do |expression|
      express expression, genes do |category, key, matches|
        results[category][key] = matches
      end
    end
    results
  end

end


