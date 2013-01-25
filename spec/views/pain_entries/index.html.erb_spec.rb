require 'spec_helper'

describe "pain_entries/index" do
  before(:each) do
    assign(:pain_entries, [
      stub_model(PainEntry,
        :pain_id => 1,
        :user_id => 2,
        :value => 3,
        :comment => "Comment"
      ),
      stub_model(PainEntry,
        :pain_id => 1,
        :user_id => 2,
        :value => 3,
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of pain_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
