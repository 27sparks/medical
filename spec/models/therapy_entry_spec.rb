require 'spec_helper'

describe TherapyEntry do
  let(:user) { FactoryGirl.create(:user) }
   before do    
     @therapy_entry = user.therapy_entries.create!(:user_id => user.id)
   end
  
   it { should respond_to(:therapy_type) }
   it { should respond_to(:duration) }
   it { should respond_to(:date) }
   it { should respond_to(:occured_at) }
   it { should respond_to(:intensity) }
   it { should respond_to(:comment) }
  
end
