require 'spec_helper'

describe "beings/edit" do
  before(:each) do
    @being = assign(:being, stub_model(Being,
      :name => "",
      :age => 1,
      :alive => false,
      :history => "",
      :gender => "MyString"
    ))
  end

  it "renders the edit being form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", being_path(@being), "post" do
      assert_select "input#being_age[name=?]", "being[age]"
      assert_select "input#being_alive[name=?]", "being[alive]"
      assert_select "select#being_gender[name=?]", "being[gender]"
    end
  end
end
