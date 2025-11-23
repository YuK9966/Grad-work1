require 'rails_helper'
RSpec.describe "Naillogs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/naillogs/index"
      expect(response).to have_http_status(:success)
    end
  end
end
