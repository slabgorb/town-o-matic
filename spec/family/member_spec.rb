require 'spec_helper'
describe Townomatic::Family::Member do
  before :all do
    @adam = Townomatic::Family::Member.new
  end

  it 'adds a child to a parent' do
    child = Townomatic::Family::Member.new
    @adam << child
    expect(@adam.children.include?(child)).to be true
  end

  it 'disallows adding an extant child to a parent' do
    child = Townomatic::Family::Member.new
    @adam << child
    expect { @adam << child }.to raise_error
  end

  it 'knows the parent of a child' do
    child = Townomatic::Family::Member.new
    @adam << child
    expect(child.parents.include?(@adam)).to be true
  end


end
