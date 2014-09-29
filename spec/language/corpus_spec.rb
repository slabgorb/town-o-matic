require 'spec_helper'

describe Townomatic::Language::Corpus do
  before :all do
    @corpus = Townomatic::Language::Corpus.new('corpora/test.txt')
  end

  context 'histogram' do
    it 'compiles' do
      expect(@corpus.histo[["^", "^"]]).to eq({"w"=>1})
    end
  end

end
