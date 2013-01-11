require 'spec_helper'

describe "Pains" do
  describe "GET /pains" do
    it "works! (now write some real specs)" do
      get pains_path
      response.status.should be(200)
    end
  end

  describe "GET /pains/new" do
    it "should render the new entry page" do
      visit new_pain_path
      page.should have_selector("h1", text: "Neuer Eintrag in Ihr Schmerztagebuch")
    end
  end
end
