require 'spec_helper'

describe Phenotype do
  before :all do
    @phenotype = FactoryGirl.create(:phenotype)
    @adam = FactoryGirl.create(:being)
  end

  it 'scans for matches' do
    # get a match string from the actual genotype
    to_be_matched = @adam.genotype.first
    @phenotype.scan(@adam.genotype, '000').should be 3
  end

  # it 'expresses' do
  #   @phenotype.expression(@adam.genotype.genes).should_not eq({ })
  # end
end



