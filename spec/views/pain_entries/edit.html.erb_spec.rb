require 'spec_helper'

describe "pain_entries/edit" do
  before(:each) do
    @pain_entry = assign(:pain_entry, stub_model(PainEntry,
      :pain_id => 1,
      :user_id => 1,
      :value => 1,
      :comment => "MyString"
    ))
  end

  it "renders the edit pain_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pain_entries_path(@pain_entry), :method => "post" do
      assert_select "input#pain_entry_pain_id", :name => "pain_entry[pain_id]"
      assert_select "input#pain_entry_user_id", :name => "pain_entry[user_id]"
      assert_select "input#pain_entry_value", :name => "pain_entry[value]"
      assert_select "input#pain_entry_comment", :name => "pain_entry[comment]"
    end
  end
end
