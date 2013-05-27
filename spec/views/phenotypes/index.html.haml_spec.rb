require 'spec_helper'

describe "phenotypes/index" do
  before(:each) do
    assign(:phenotypes, [
      stub_model(Phenotype,
        :name => "Name",
        :morphology => "",
        :development => "",
        :behavior => ""
      ),
      stub_model(Phenotype,
        :name => "Name",
        :morphology => "",
        :development => "",
        :behavior => ""
      )
    ])
  end

  it "renders a list of phenotypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
