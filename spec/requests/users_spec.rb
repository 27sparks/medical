require 'spec_helper'

describe "Users" do
  before do
    @user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { page }

  describe "users index page" do
    before { visit users_path }
    it { should have_content(@user.name) }
    it { should have_content(@user.email) }
    it { should have_selector("a", text: "bearbeiten") }
    it { should have_selector("title", text: "Alle Benutzer")}
  end

  describe "new user page" do
    before { visit new_user_path }
    it { should have_selector("h1", text: "Als Benutzer Registrieren") }
    it { should have_selector("title", text: "Registrieren") }
  end

  describe "register page" do
    before { visit register_path }
    it { should have_selector('h1',    text: 'Als Benutzer Registrieren') }
    it { should have_selector('title', text: 'Registrieren') }
  end

  describe "user page" do
    before  { visit user_path(@user.id) }
    it { should have_selector("h1", text: @user.name) }
    it { should have_selector("a", text: "Benutzerdaten bearbeiten") }
    it { should have_selector("title", text: @user.name)}

  end

  describe "edit user page" do
    before { visit edit_user_path(@user.id) }
    it { should have_selector("h1", text: "Benutzerdaten von #{@user.name} bearbeiten") }
    it { should have_selector("title", text: "Benutzerdaten von #{@user.name} bearbeiten")}
  end
end
