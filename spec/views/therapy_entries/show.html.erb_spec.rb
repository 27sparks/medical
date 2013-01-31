require 'spec_helper'

describe "therapy_entries/show" do
  before(:each) do
    @therapy_entry = assign(:therapy_entry, stub_model(TherapyEntry,
      :type => "Type",
      :intensity => "Intensity",
      :duration => 1,
      :comment => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(/Intensity/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
