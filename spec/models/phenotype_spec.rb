require 'spec_helper'

describe Phenotype do
  before :all do
    @phenotype = FactoryGirl.create(:phenotype)
    @genotype = FactoryGirl.create(:genotype)
  end

  it 'expresses morphology' do
    @phenotype.express @genotype.genes{  |gene, category, value|  }
  end
end
