require 'spec_helper'

describe "Pain pages" do
  let(:user) { FactoryGirl.create(:user) }
  let(:pain) { FactoryGirl.create(:pain, user_id: user.id) }
  subject { page }
  before do
    valid_log_in(user)
  end

  describe "show a kind" do
    before { visit pain_path(pain) }
    it { should have_selector('h1', text: pain.name) }
    it { should have_content(pain.description) }
    it { should have_content(pain.bodypart) }
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
    
    it "should create a pain kind" do
      expect { click_button submit }.to change(Pain, :count).by(1)
    end
  end
  
  describe "deleting a pain kind" do
    before do
      @pain = user.pains.create(name: "au", bodypart:"kopf")
      visit pains_path
    end
    it { should have_content("Schmerzart") }
    it { should have_content(@pain.user.name) }
    it { should have_content(@pain.name) }
    it { should have_selector("a", id: "edit") }
    it { should have_selector("a", id: "delete") }
    
    it "should delete a pain kind" do
      expect { click_link("delete") }.to change(Pain, :count).by(-1)
    end
  end  
  
  describe "edit a kind" do
    before do
      @pain = user.pains.create(name: "au", bodypart:"kopf")
      visit edit_pain_path(@pain)
    end
    
    it { should have_content(@pain.name) }
    it { should have_selector('input', id: 'pain_name') }
    it { should have_selector('select', id: 'pain_bodypart') }
    
    let(:new_name)  { "New Name" }
    let(:new_bodypart) { "new@example.com" }
    
    before do
      fill_in "Name",         with: :new_name      
      select "rumpf",         from: :bodypart
    end
    
    let(:submit) { "Speichern" }
    
    it "should edit a pain kind" do
      
    end
    
  end
    

end
