require 'spec_helper'

describe "therapy_entries/index" do
  before(:each) do
    assign(:therapy_entries, [
      stub_model(TherapyEntry,
        :type => "Type",
        :intensity => "Intensity",
        :duration => 1,
        :comment => ""
      ),
      stub_model(TherapyEntry,
        :type => "Type",
        :intensity => "Intensity",
        :duration => 1,
        :comment => ""
      )
    ])
  end

  it "renders a list of therapy_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Intensity".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
