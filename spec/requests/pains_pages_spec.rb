require 'spec_helper'

describe "Pain pages" do
  let(:user) { FactoryGirl.create(:user) }
  let(:pain) { FactoryGirl.create(:pain) }
  subject { page }
  before do
    valid_log_in(user)
  end

  describe "show a kind" do
    before { visit pain_path(pain) }
    it { should have_selector('h1', text: pain.name) }
  end

  describe  "creating a new kind" do
    before { visit new_pain_path }
    it { should have_selector("h1") }
    it { should have_selector('input', id: 'pain_name') }
    it { should have_selector('select', id: 'pain_bodypart') }
    
    let(:new_name)  { "New Name" }
    let(:new_bodypart) { "new@example.com" }
    
    before do
      fill_in "Name",         with: :new_name
      select "rumpf",         from: :bodypart
    end
    let(:submit) { "Speichern" }
    
    it "should create a user" do
      expect { click_button submit }.to change(Pain, :count).by(1)
    end
    
  end
  
  describe "listing all kinds" do
    before do
      visit pains_path 
    end
    save_and_open_page
    
    it { should have_selector("h1", text: "Schmerzarten") }
    it { should have_content(pain.name) }
    it { should have_content(pain.bodypart) }
    it { should have_link("edit", href: edit_pain_path(pain)) }
  end

end
