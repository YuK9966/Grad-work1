class ColorsController < ApplicationController
  def index
    @color = Color.order("RANDOM()").first
    @sq_color = @color.color_code
    if @color.color_code == "#F5F5F5"
      @text_color = "#2E2E2E"
    else
      @text_color = @color.color_code
    end
  end
end
