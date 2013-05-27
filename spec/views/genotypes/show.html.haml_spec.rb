require 'spec_helper'

describe "genotypes/show" do
  before(:each) do
    @genotype = assign(:genotype, stub_model(Genotype,
      :genes => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
