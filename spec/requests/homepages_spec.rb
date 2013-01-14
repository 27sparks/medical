require 'spec_helper'

describe "Homepages" do
  before { visit root_path }
  subject { page }

  it { should have_content('Schmerztagebuch') }
  it { should have_selector("a", text: "Neuer Eintrag") }
end
