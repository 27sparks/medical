require 'spec_helper'

describe "therapy_entries/edit" do
  before(:each) do
    @therapy_entry = assign(:therapy_entry, stub_model(TherapyEntry,
      :type => "",
      :intensity => "MyString",
      :duration => 1,
      :comment => ""
    ))
  end

  it "renders the edit therapy_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => therapy_entries_path(@therapy_entry), :method => "post" do
      assert_select "input#therapy_entry_type", :name => "therapy_entry[type]"
      assert_select "input#therapy_entry_intensity", :name => "therapy_entry[intensity]"
      assert_select "input#therapy_entry_duration", :name => "therapy_entry[duration]"
      assert_select "input#therapy_entry_comment", :name => "therapy_entry[comment]"
    end
  end
end
