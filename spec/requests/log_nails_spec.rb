require 'rails_helper'

RSpec.describe "LogNails", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/log_nails/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/log_nails/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
