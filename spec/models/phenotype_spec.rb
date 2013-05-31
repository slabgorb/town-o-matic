require 'spec_helper'

describe Phenotype do
  before :all do
    @phenotype = FactoryGirl.create(:phenotype)
    @adam = FactoryGirl.create(:being)
  end

  it 'scans for matches' do
    @phenotype.scan(@adam.genotype, '000').should_not be_nil
  end

  it 'expresses' do
    @phenotype.expression(@adam.genotype.genes).should_not eq({ })
  end
end



