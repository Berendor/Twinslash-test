require 'rails_helper'

RSpec.describe AdvertisingsController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "has a 302 status code if not logged" do
      get :new
      expect(response.status).to eq(302)
    end
  end
end
