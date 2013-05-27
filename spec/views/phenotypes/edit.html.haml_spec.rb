require 'spec_helper'

describe "phenotypes/edit" do
  before(:each) do
    @phenotype = assign(:phenotype, stub_model(Phenotype,
      :name => "MyString",
      :morphology => "",
      :development => "",
      :behavior => ""
    ))
  end

  it "renders the edit phenotype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phenotype_path(@phenotype), "post" do
      assert_select "input#phenotype_name[name=?]", "phenotype[name]"
      assert_select "input#phenotype_morphology[name=?]", "phenotype[morphology]"
      assert_select "input#phenotype_development[name=?]", "phenotype[development]"
      assert_select "input#phenotype_behavior[name=?]", "phenotype[behavior]"
    end
  end
end
