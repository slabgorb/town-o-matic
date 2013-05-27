class Phenotype
  include Mongoid::Document
  field :name, :type => String
  field :morphology, :type => Hash
  field :development, :type => Hash
  field :behavior, :type => Hash
end
