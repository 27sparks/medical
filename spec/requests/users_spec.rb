require 'spec_helper'

describe "Users" do

  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe "users index page" do
    before { visit users_path }
    # it { should have_content(user.name) }
    # it { should have_content(user.email) }
    # it { should have_selector("a", text: "bearbeiten") }
    # it { should have_selector("title", text: "Alle Benutzer")}
  end


  describe "user page" do
    before  { visit user_path(user.id) }
    it { should have_selector("h1", text: user.name) }
    it { should have_selector("a", text: "Benutzerdaten bearbeiten") }
    it { should have_selector("title", text: user.name)}

  end

  describe "edit user page" do
    before { visit edit_user_path(user.id) }
    it { should have_selector("h1", text: "Benutzerdaten von #{user.name} bearbeiten") }
    it { should have_selector("title", text: "Benutzerdaten von #{user.name} bearbeiten")}
  end

  describe "register page" do
    before { visit register_path }
    it { should have_selector('h1',    text: 'Registrieren') }
    it { should have_selector('title', text: 'Registrieren') }
  end

  describe "register" do

    before { visit register_path }

    let(:submit) { "Registrieren" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
