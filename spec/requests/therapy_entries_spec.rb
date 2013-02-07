require 'spec_helper'

describe "TherapyEntries" do
  describe "create an entry" do
    it { should have_content('Krankengymnastik') }
  end
  
  describe "show an entry" do
    it { should have_content('Krankengymnastik') }
  end

  describe "edit an entry" do
    it { should have_content('Massage') }   
  end

  describe "delete an entry" do   
    it { should_not have_content('Massage') } 
  end
end
