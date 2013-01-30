require 'spec_helper'

describe PainEntry do
 let(:user) { FactoryGirl.create(:user) }
  before do    
    @pain_entry = user.pain_entries.create!( :pain_type => "stechend", :value => "55", :body_part => "Kopf")
  end
  
  subject{ @pain_entry }
  
  it { should respond_to(:occured_at) }
end
