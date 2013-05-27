require 'spec_helper'

describe "genotypes/new" do
  before(:each) do
    assign(:genotype, stub_model(Genotype,
      :genes => ""
    ).as_new_record)
  end

  it "renders new genotype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", genotypes_path, "post" do
      assert_select "input#genotype_genes[name=?]", "genotype[genes]"
    end
  end
end
