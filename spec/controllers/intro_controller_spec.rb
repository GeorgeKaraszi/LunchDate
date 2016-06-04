require 'rails_helper'

RSpec.describe IntroController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #schedule" do
    it "returns http success" do
      get :schedule
      expect(response).to have_http_status(:success)
    end
  end

end
