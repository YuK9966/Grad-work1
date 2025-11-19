require 'rails_helper'

RSpec.describe "NailItems", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/nail_items/new"
      expect(response).to have_http_status(:success)
    end
  end

end
