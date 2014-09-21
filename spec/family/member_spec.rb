require 'spec_helper'
describe Townomatic::Family::Member do
  before :each do
    @adam = Townomatic::Family::Member.new('Adam')
    @child = Townomatic::Family::Member.new('Cain')
    @eve = Townomatic::Family::Member.new('Eve')
    @adam.marry @eve
    @adam << @child
    @delilah = Townomatic::Family::Member.new('Delilah')
  end

  it 'knows spouses' do
    expect(@adam.spouses.include?(@eve)).to be true
  end

  it 'allows divorces' do
    @adam.divorce! @eve
    expect(@adam.spouses.include?(@eve)).to be false
  end

  it 'disallows divorces to unmarried people' do
    @adam.divorce! @eve
    expect { @adam.divorce! @delilah }.to raise_error
  end

  it 'adds a child to a parent' do
    expect(@adam.children.include?(@child)).to be true
  end

  it 'disallows adding an extant child to a parent' do
    expect { @adam << @child }.to raise_error
  end

  it 'knows the parent of a child' do
    expect(@child.parents.include?(@adam)).to be true
  end

  it 'knows the spousal parent of a child' do
    expect(@child.parents.include?(@eve)).to be true
  end

  it 'knows siblings of a child' do
    child2 = Townomatic::Family::Member.new
    @adam << child2
    expect(@child.siblings.include?(child2)).to be true
  end

  it 'knows siblings do not include the member' do
    expect(@child.siblings.include?(@child)).to be false
  end

  it 'knows about half-siblings' do
    step_sibling = Townomatic::Family::Member.new
    @eve << step_sibling
    expect(@child.siblings.include?(step_sibling)).to be true
  end

end
