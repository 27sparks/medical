require 'spec_helper'

describe Pain do

  before do
    @pain = Pain.new(name: "Example", bodypart: "rumpf")
  end

  after do
    @pain.delete
  end
  
  subject { @pain }

  it { should respond_to(:name) }
  it { should respond_to(:bodypart) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @pain.name = " " }
    it { should_not be_valid }
  end
  
  describe "when bodypart is not present" do
    before { @pain.bodypart = " " }
    it { should_not be_valid }
  end
  
end
