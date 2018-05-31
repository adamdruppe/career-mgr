require "rails_helper"

RSpec.describe OpportunitiesController, type: :routing do
  describe "routing" do
    let(:employer_id) { '1001' }

    it "routes to #index" do
      expect(:get => "/employers/#{employer_id}/opportunities").to route_to("opportunities#index", employer_id: employer_id)
    end

    it "routes to #new" do
      expect(:get => "/employers/#{employer_id}/opportunities/new").to route_to("opportunities#new", employer_id: employer_id)
    end

    it "routes to #show" do
      expect(:get => "/employers/#{employer_id}/opportunities/1").to route_to("opportunities#show", employer_id: employer_id, :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/employers/#{employer_id}/opportunities/1/edit").to route_to("opportunities#edit", employer_id: employer_id, :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/employers/#{employer_id}/opportunities").to route_to("opportunities#create", employer_id: employer_id)
    end

    it "routes to #update via PUT" do
      expect(:put => "/employers/#{employer_id}/opportunities/1").to route_to("opportunities#update", employer_id: employer_id, :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/employers/#{employer_id}/opportunities/1").to route_to("opportunities#update", employer_id: employer_id, :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/employers/#{employer_id}/opportunities/1").to route_to("opportunities#destroy", employer_id: employer_id, :id => "1")
    end

  end
end
