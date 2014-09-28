require 'spec_helper'
describe Townomatic::Town do
  before :each do
    @adam = Townomatic::Family::Member.new('Adam', 'Man')
    @town = Townomatic::Town.new("My Town", @adam)
  end

  it "should count the ruler as an inhabitant" do
  end

end
