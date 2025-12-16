class PagesController < ApplicationController
  def index
    @naillogs = Naillog.published.order(created_at: :desc).limit(5)
  end
end
