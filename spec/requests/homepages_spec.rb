require 'spec_helper'

describe "Homepages" do
  before { visit root_path }
  subject { page }

  it { should have_content('Medical Diary') }

  describe  "if there is no user logged in" do
    it { should have_selector("h1", text: 'Log in') }
  end

  describe "if there is a user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    before { valid_log_in(user) }

    it { should have_content(user.name)}
    it { should have_link("Neue Schmerzart", href: new_pain_path) }
  end
end
