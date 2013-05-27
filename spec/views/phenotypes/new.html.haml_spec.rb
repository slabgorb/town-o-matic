require 'spec_helper'

describe "phenotypes/new" do
  before(:each) do
    assign(:phenotype, stub_model(Phenotype,
      :name => "MyString",
      :morphology => "",
      :development => "",
      :behavior => ""
    ).as_new_record)
  end

  it "renders new phenotype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phenotypes_path, "post" do
      assert_select "input#phenotype_name[name=?]", "phenotype[name]"
      assert_select "input#phenotype_morphology[name=?]", "phenotype[morphology]"
      assert_select "input#phenotype_development[name=?]", "phenotype[development]"
      assert_select "input#phenotype_behavior[name=?]", "phenotype[behavior]"
    end
  end
end
