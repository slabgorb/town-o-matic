require 'spec_helper'
describe Townomatic::Dwelling do
  before :each do
    @house = Townomatic::Dwelling.new('House')
    @adam = Townomatic::Family::Member.new('Adam', 'Man')
    @eve = Townomatic::Family::Member.new('Eve', 'Man')
    @town = Townomatic::Town.new("My Town", @adam)
    @town << @house

    @house << @adam
    @house << @eve
  end

  it "has people" do
    expect(@house.inhabitants).to eq [@adam, @eve]
  end

  it "knows the population" do
    expect(@house.population).to eq 2
  end

  it "removes dead men from the population" do
    @adam.die!
    expect(@house.population).to eq 1
  end

  it "shows the location when expressed as a string" do
    expect(@house.to_s).to eq "House in My Town"
  end

end
