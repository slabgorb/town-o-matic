require "spec_helper"

describe GenotypesController do
  describe "routing" do

    it "routes to #index" do
      get("/genotypes").should route_to("genotypes#index")
    end

    it "routes to #new" do
      get("/genotypes/new").should route_to("genotypes#new")
    end

    it "routes to #show" do
      get("/genotypes/1").should route_to("genotypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/genotypes/1/edit").should route_to("genotypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/genotypes").should route_to("genotypes#create")
    end

    it "routes to #update" do
      put("/genotypes/1").should route_to("genotypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/genotypes/1").should route_to("genotypes#destroy", :id => "1")
    end

  end
end
