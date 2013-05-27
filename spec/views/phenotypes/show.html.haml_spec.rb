require 'spec_helper'

describe "phenotypes/show" do
  before(:each) do
    @phenotype = assign(:phenotype, stub_model(Phenotype,
      :name => "Name",
      :morphology => "",
      :development => "",
      :behavior => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
