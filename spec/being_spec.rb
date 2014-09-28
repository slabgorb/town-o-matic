require 'spec_helper'
describe Townomatic::Being do
  before :each do
    @adam = Townomatic::Being.new(given_name:'Adam')
  end

  it "should know whether it is alive" do
    expect(@adam.alive?).to be true
    @adam.die!
    expect(@adam.alive?).to be false
  end
end
