require 'spec_helper'

describe "pain_entries/show" do
  before(:each) do
    @pain_entry = assign(:pain_entry, stub_model(PainEntry,
      :pain_id => 1,
      :user_id => 2,
      :value => 3,
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Comment/)
  end
end
