require 'spec_helper'
describe Townomatic::Dwelling do
  before :each do
    @house = Townomatic::Dwelling.new('House')
    @adam = Townomatic::Family::Member.new('Adam', 'Man')
    @eve = Townomatic::Family::Member.new('Eve', 'Man')
    @house << @adam
    @house << @eve
  end

  it "has people" do
    expect(@house.inhabitants).to eq [@adam, @eve]
  end

  it "knows the population" do
    expect(@house.population).to eq 2
  end


end
