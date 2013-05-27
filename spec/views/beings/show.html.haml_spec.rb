require 'spec_helper'

describe "beings/show" do
  before(:each) do
    @being = assign(:being, stub_model(Being,
      :name => "",
      :age => 1,
      :alive => false,
      :history => "",
      :gender => "Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(//)
    rendered.should match(/Gender/)
  end
end
