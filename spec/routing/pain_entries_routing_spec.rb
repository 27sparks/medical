require "spec_helper"

describe PainEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/pain_entries").should route_to("pain_entries#index")
    end

    it "routes to #new" do
      get("/pain_entries/new").should route_to("pain_entries#new")
    end

    it "routes to #show" do
      get("/pain_entries/1").should route_to("pain_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pain_entries/1/edit").should route_to("pain_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pain_entries").should route_to("pain_entries#create")
    end

    it "routes to #update" do
      put("/pain_entries/1").should route_to("pain_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pain_entries/1").should route_to("pain_entries#destroy", :id => "1")
    end

  end
end
