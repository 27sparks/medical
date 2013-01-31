require 'spec_helper'

describe "PainEntries" do
  let(:user) { FactoryGirl.create(:user) }
  let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com", id: user.id + 1) }
  subject { page }
  
  describe "visit users pain entries as user" do
    before do
      @pain_entry = user.pain_entries.create!( :pain_type => "stechend", :value => "55", :body_part => "Kopf")
      valid_log_in(user)
      visit pain_entries_path
    end
    
    it { should have_content("Schmerz") }
    it { should have_content("Beschreibung") }
    it { should have_content("Kommentar") }
    it { should have_content(@pain_entry.pain_type) }
    it { should have_content(@pain_entry.body_part) }
  end
  
  describe "visit users pain entries as wrong user" do
    before do
      @pain_entry = user.pain_entries.create!( :pain_type => "stechend", :value => "55", :body_part => "Kopf")
      valid_log_in(wrong_user)
      visit pain_entries_path
    end
    
    it { should have_content("Schmerz") }
    it { should have_content("Beschreibung") }
    it { should have_content("Kommentar") }
    it { should_not have_content(@pain_entry.pain_type) }
    it { should_not have_content(@pain_entry.body_part) }
  end
  
  describe "editing pain entries" do
    before do
      @pain_entry = user.pain_entries.create!( :pain_type => "stechend", :value => "55", :body_part => "Kopf")
      valid_log_in(user)
      visit edit_pain_entry_path(@pain_entry)
    end
    
    after do
      @pain_entry.destroy
    end
    
    describe "the edit page should look okay" do
      it { should have_selector("h1", text: "Schmerzeintrag bearbeiten") }
      it { should have_selector("label", text: "Value") }
      it { should have_selector("input", id: "pain_entry_value") }
      it { should have_button("Speichern") }
    end
    
    describe "filling out the form should edit a pain entry" do
      let(:submit) { "Speichern" }
      subject { @pain_entry }
    
      before do
        select "Arm", from: "Body part"
        @pain_entry.value = 10
        click_button "Speichern"
      end
       
    end
    
  end
  
  describe "creating pain entries" do
    before do
      valid_log_in(user)
      visit new_pain_entry_path
    end
    
    let(:submit) { "Speichern" }
    
    it { should have_content("Neuer Schmerzeintrag") }
    it { should have_content("Value") }
    before do
      select "Kopf", from: "Body part"
      select "mitte", from: "Side"
      select "juckend", from: "Pain type"
      fill_in "Value", with: 65
      fill_in "Comment", with: "comment"
      select "Ein paar Minuten", from: "Duration"
    end
    
    it "should create a pain entry" do
      expect { click_button submit }.to change(PainEntry, :count).by(1)
    end
  end
end
