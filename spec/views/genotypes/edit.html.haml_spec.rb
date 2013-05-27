require 'spec_helper'

describe "genotypes/edit" do
  before(:each) do
    @genotype = assign(:genotype, stub_model(Genotype,
      :genes => ""
    ))
  end

  it "renders the edit genotype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", genotype_path(@genotype), "post" do
      assert_select "input#genotype_genes[name=?]", "genotype[genes]"
    end
  end
end
