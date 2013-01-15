require 'spec_helper'

describe "Homepages" do
  before { visit root_path }
  subject { page }

  it { should have_content('Schmerztagebuch') }

  describe  "if there is no user logged in" do
    it { should have_selector("h1", text: 'Log in') }
  end

  describe "if there is a user logged in" do

    let(:user) { FactoryGirl.create(:user) }
    before do
      fill_in "Email",    with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    it { should have_content(user.name)}
  end
end
