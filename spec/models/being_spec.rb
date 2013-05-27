require 'spec_helper'

describe Being do
  before :all do
    @adam = FactoryGirl.create :being
  end
  it 'makes the name from the array of names' do
    @adam.name.should be('Adam Man')
  end


end
