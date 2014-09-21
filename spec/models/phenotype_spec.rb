require 'spec_helper'

describe Phenotype do
  before :all do
    srand(12345)
    @phenotype = FactoryGirl.create(:phenotype)
    @adam = FactoryGirl.create(:being)
  end

  it 'scans for matches' do
    # get a match string from the actual genotype
    to_be_matched = @adam.genotype.first
    @phenotype.scan(@adam.genotype, to_be_matched).length.should be(1)
  end

  context 'expresses' do
    before :each do
      @hsh = { }
      [:morphology, :development, :behavior].each do |expression_type|
        @phenotype.express :morphology, @adam.genotype do |category, key, matches|
          @hsh[category.to_sym] ||= { }
          @hsh[category.to_sym][key.to_sym] = matches
        end
      end
    end

    it 'expresses morphology' do
      @hsh[:hair_color][:brown].length.should eq(0)
      @hsh[:hair_color][:black].length.should eq(1)
    end
    it 'expresses development' do
      @hsh[:hair_color][:brown].length.should eq(0)
      @hsh[:hair_color][:black].length.should eq(1)
    end
    it 'expresses behavior' do
      @hsh[:disposition][:easygoing].length.should eq(1)
      @hsh[:disposition][:angry].length.should eq(1)
    end
  end


end



