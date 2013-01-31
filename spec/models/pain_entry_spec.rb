require 'spec_helper'

describe PainEntry do
 let(:user) { FactoryGirl.create(:user) }
  before do    
    @pain_entry = user.pain_entries.create!( :pain_type => "stechend", :value => "55", :body_part => "Kopf")
  end
  
  subject{ @pain_entry }
  
  it { should respond_to(:value) }
  it { should respond_to(:body_part) }
  it { should respond_to(:pain_type) }
  it { should respond_to(:duration) }
  it { should respond_to(:user_id) }
  it { should respond_to(:comment) }
  it { should respond_to(:side) }
  it { should respond_to(:date) }
  it { should respond_to(:occured_at) }
end
