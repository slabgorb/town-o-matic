require 'spec_helper'

describe "beings/new" do
  before(:each) do
    assign(:being, stub_model(Being,
      :name => "",
      :age => 1,
      :alive => false,
      :history => "",
      :gender => "MyString"
    ).as_new_record)
  end

  it "renders new being form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beings_path, "post" do
      assert_select "input#being_name[name=?]", "being[name]"
      assert_select "input#being_age[name=?]", "being[age]"
      assert_select "input#being_alive[name=?]", "being[alive]"
      assert_select "input#being_history[name=?]", "being[history]"
      assert_select "input#being_gender[name=?]", "being[gender]"
    end
  end
end
