require 'spec_helper'

describe Pain do

  before do
    @user = User.create(name: "Example User", email: "user@example.co", password: "foobar", password_confirmation: "foobar")
    @pain = @user.pains.create(name: "Example", bodypart: "rumpf", description: "bla bla")
  end


  
  subject { @pain }
  it { should respond_to(:name) }
  it { should respond_to(:bodypart) }
  it { should respond_to(:user_id) }
  it { should respond_to(:description) }
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
