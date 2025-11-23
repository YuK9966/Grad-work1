require 'rails_helper'

RSpec.describe "NailStocks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/nail_stocks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/nail_stocks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/nail_stocks/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
