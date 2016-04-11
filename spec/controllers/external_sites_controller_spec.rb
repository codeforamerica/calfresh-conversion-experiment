require 'rails_helper'

describe ExternalSitesController do
  describe "GET /apply" do
    before do
      get :getcalfresh
    end

    it "is successful" do
      expect(response).to be_success
    end

    it "assigns the link URL to have a source parameter for tracking" do
      expect(assigns[:link_url]).to include("?source=study")
    end
  end
end
