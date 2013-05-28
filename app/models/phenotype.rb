class Phenotype
  include Mongoid::Document
  field :name, :type => String
  field :morphology_expression, :type => Hash
  field :development_expression, :type => Hash
  field :behavior_expression, :type => Hash

  def express(genotype, &block)
    send("#{expression}_expression").each_pair do |category, value_set|
      value_set.each_pair do |key, marker|
        matches = genotype.to_s.scan(marker)
        yield category, key, matches
      end
    end
  end

end


