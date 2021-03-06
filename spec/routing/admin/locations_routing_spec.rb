require_relative "../../rails_helper"

RSpec.describe Admin::LocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/employers/1/locations").to route_to("admin/locations#index", employer_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/admin/employers/1/locations/new").to route_to("admin/locations#new", employer_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/admin/locations/1").to route_to("admin/locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/locations/1/edit").to route_to("admin/locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/employers/1/locations").to route_to("admin/locations#create", employer_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/locations/1").to route_to("admin/locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/locations/1").to route_to("admin/locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/locations/1").to route_to("admin/locations#destroy", :id => "1")
    end

  end
end
