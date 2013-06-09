require 'spec_helper'

describe Being do
  before :all do
    @adam = FactoryGirl.create :being
  end

  it 'makes the name from the array of names' do
    @adam.name.should eq('Adam Man')
  end

  it 'defaults to being alive' do
    @adam.alive?.should be_true
  end

  it 'can die' do
    @adam.die!
    @adam.alive?.should be_false
  end

  context 'genetics' do
    it 'has a genotype' do
      @adam.genotype.should_not be_nil
    end
  end

end
