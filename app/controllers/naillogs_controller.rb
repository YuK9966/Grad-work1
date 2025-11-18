class NaillogsController < ApplicationController
  def index
    @naillogs = Naillog.order(created_at: :desc)
  end
end
