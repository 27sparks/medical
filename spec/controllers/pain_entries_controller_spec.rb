require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PainEntriesController do

  # This should return the minimal set of attributes required to create a valid
  # PainEntry. As you add validations to PainEntry, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "pain_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PainEntriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all pain_entries as @pain_entries" do
      pain_entry = PainEntry.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pain_entries).should eq([pain_entry])
    end
  end

  describe "GET show" do
    it "assigns the requested pain_entry as @pain_entry" do
      pain_entry = PainEntry.create! valid_attributes
      get :show, {:id => pain_entry.to_param}, valid_session
      assigns(:pain_entry).should eq(pain_entry)
    end
  end

  describe "GET new" do
    it "assigns a new pain_entry as @pain_entry" do
      get :new, {}, valid_session
      assigns(:pain_entry).should be_a_new(PainEntry)
    end
  end

  describe "GET edit" do
    it "assigns the requested pain_entry as @pain_entry" do
      pain_entry = PainEntry.create! valid_attributes
      get :edit, {:id => pain_entry.to_param}, valid_session
      assigns(:pain_entry).should eq(pain_entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PainEntry" do
        expect {
          post :create, {:pain_entry => valid_attributes}, valid_session
        }.to change(PainEntry, :count).by(1)
      end

      it "assigns a newly created pain_entry as @pain_entry" do
        post :create, {:pain_entry => valid_attributes}, valid_session
        assigns(:pain_entry).should be_a(PainEntry)
        assigns(:pain_entry).should be_persisted
      end

      it "redirects to the created pain_entry" do
        post :create, {:pain_entry => valid_attributes}, valid_session
        response.should redirect_to(PainEntry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pain_entry as @pain_entry" do
        # Trigger the behavior that occurs when invalid params are submitted
        PainEntry.any_instance.stub(:save).and_return(false)
        post :create, {:pain_entry => { "pain_id" => "invalid value" }}, valid_session
        assigns(:pain_entry).should be_a_new(PainEntry)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PainEntry.any_instance.stub(:save).and_return(false)
        post :create, {:pain_entry => { "pain_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pain_entry" do
        pain_entry = PainEntry.create! valid_attributes
        # Assuming there are no other pain_entries in the database, this
        # specifies that the PainEntry created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PainEntry.any_instance.should_receive(:update_attributes).with({ "pain_id" => "1" })
        put :update, {:id => pain_entry.to_param, :pain_entry => { "pain_id" => "1" }}, valid_session
      end

      it "assigns the requested pain_entry as @pain_entry" do
        pain_entry = PainEntry.create! valid_attributes
        put :update, {:id => pain_entry.to_param, :pain_entry => valid_attributes}, valid_session
        assigns(:pain_entry).should eq(pain_entry)
      end

      it "redirects to the pain_entry" do
        pain_entry = PainEntry.create! valid_attributes
        put :update, {:id => pain_entry.to_param, :pain_entry => valid_attributes}, valid_session
        response.should redirect_to(pain_entry)
      end
    end

    describe "with invalid params" do
      it "assigns the pain_entry as @pain_entry" do
        pain_entry = PainEntry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PainEntry.any_instance.stub(:save).and_return(false)
        put :update, {:id => pain_entry.to_param, :pain_entry => { "pain_id" => "invalid value" }}, valid_session
        assigns(:pain_entry).should eq(pain_entry)
      end

      it "re-renders the 'edit' template" do
        pain_entry = PainEntry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PainEntry.any_instance.stub(:save).and_return(false)
        put :update, {:id => pain_entry.to_param, :pain_entry => { "pain_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pain_entry" do
      pain_entry = PainEntry.create! valid_attributes
      expect {
        delete :destroy, {:id => pain_entry.to_param}, valid_session
      }.to change(PainEntry, :count).by(-1)
    end

    it "redirects to the pain_entries list" do
      pain_entry = PainEntry.create! valid_attributes
      delete :destroy, {:id => pain_entry.to_param}, valid_session
      response.should redirect_to(pain_entries_url)
    end
  end

end
