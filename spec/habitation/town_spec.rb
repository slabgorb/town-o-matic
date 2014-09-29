require 'spec_helper'
describe Townomatic::Town do
  before :each do
    @adam = Townomatic::Family::Member.new('Adam', 'Man')
    @town = Townomatic::Town.new("My Town", @adam)
    @castle = Townomatic::Dwelling.new("Castle Aaargh")
    @castle << @adam
    @town << @castle
    @nation = Townomatic::Nation.new("Testland")
  end

  it "adds dwelling inhabitants to the population" do
    expect(@town.inhabitants).to include @adam
  end

  it "knows the ruler of the town" do
    expect(@town.ruler).to be @adam
  end

  it "has no dead rulers" do
    @adam.die!
    expect(@town.ruler).to be nil
  end

  it "puts dead men in the graveyard" do
    @adam.die!
    expect(@town.graveyard).to include @adam
  end



end
