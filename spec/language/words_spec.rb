require 'spec_helper'

describe Townomatic::Language::Words do
  before :all do
    @corpus = Townomatic::Language::Corpus.new('corpora/test.txt')
    @words = Townomatic::Language::Words.new(@corpus)

  end

  it 'makes words' do
    expect(@words.word).to eq('ordaings')
  end

end
