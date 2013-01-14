require 'spec_helper'

describe "Pains" do
  describe "pain-entries index page" do
    it "works! (now write some real specs)" do
      get pains_path
      response.status.should be(200)
    end
  end

  describe "new pain-entry page" do
    before { visit new_pain_path }
    it { page.should have_selector("h1", text: "Neuer Eintrag in Ihr Schmerztagebuch") }
  end
end
