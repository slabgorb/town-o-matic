require 'spec_helper'

describe "genotypes/index" do
  before(:each) do
    assign(:genotypes, [
      stub_model(Genotype,
        :genes => ""
      ),
      stub_model(Genotype,
        :genes => ""
      )
    ])
  end

  it "renders a list of genotypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
