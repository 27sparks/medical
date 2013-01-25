require 'spec_helper'

describe "Users" do

  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe "as not logged in guest" do
    describe "visit the users index page" do
      before { visit users_path }
      it { should have_selector('div.alert.alert-error') }
    end
  end
  describe "as logged in user" do
    before do
      valid_log_in(user)
    end

    describe "user page" do
      before { visit user_path(user.id) }
      it { should have_selector("h1", text: user.name) }
      it { should have_selector("a", text: "Benutzerdaten bearbeiten") }
      it { should have_selector("title", text: user.name)}
    end

    describe "going to users index page" do
      before { visit users_path }
      it { should have_selector('div.alert.alert-error') }
    end
  end

  describe "register page" do
    before { visit register_path }
    it { should have_selector('h1',    text: 'Registrieren') }
    it { should have_selector('title', text: 'Registrieren') }
    it { should have_selector('label', text: 'Name') }
    it { should have_selector('input', id: 'user_name') }
    it { should have_selector('input', id: 'user_email') }
    it { should_not have_selector('select', id: 'user_role') }
  end

  describe "register" do
    before { visit register_path }
    let(:submit) { "Speichern" }
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.co"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      it "should sign the user in after creation" do
        click_button submit
        page.should have_content('Log out')
      end
    end
  end

  describe "edit user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      valid_log_in(user)
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',    text: "#{user.name}") }
      it { should have_selector('title', text: "#{user.name}") }
    end

    describe "with invalid information" do
      before { click_button "Speichern" }

      it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm", with: user.password
        click_button "Speichern"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Log out', href: logout_path) }
      specify { user.reload.name.should  == new_name }
      specify { user.reload.email.should == new_email }
    end

  end

  describe "as admin user" do
    let(:user) { FactoryGirl.create(:user, role: "admin") }
    subject { page }

    describe "users index page" do
      before do
        valid_log_in(user)
        visit users_path
      end
      it { should have_content(user.name) }
      it { should have_content(user.email) }
      it { should have_link("", href: edit_user_path(user)) }
      it { should have_link("", action: "user#destroy") }
      it { should have_selector("title", text: "All Users")}
    end
  end

end
