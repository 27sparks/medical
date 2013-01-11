require 'spec_helper'

describe "Homepages" do
  describe "GET /homepages" do
    it "should render the homepage" do
      get root_path
      response.status.should be(200)
    end

    it "should have the correct headline" do
      visit root_path
      page.should have_content('Schmerztagebuch')
    end

    it "should have a button to add pain enties" do
      visit root_path
      page.should have_selector("a", text: "Neuer Eintrag")
    end
  end
end
