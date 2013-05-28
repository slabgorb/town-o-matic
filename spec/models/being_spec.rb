require 'spec_helper'

describe Being do
  before :all do
    @adam = FactoryGirl.create :being
  end

  it 'makes the name from the array of names' do
    @adam.name.should be('Adam Man')
  end

  it 'defaults to being alive' do
    @adam.alive?.should be_true
  end

  it 'can die' do
    @adam.die!
    @adam.alive?.should be_false
  end

end
