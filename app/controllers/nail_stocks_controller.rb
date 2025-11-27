class NailStocksController < ApplicationController
  def create
    @nail_item = NailItem.find(params[:nail_item_id])
    current_user.add_nail_stocks(@nail_item)
  end

  def destroy
    @nail_item = current_user.nail_stocks.find(params[:id]).nail_item
    current_user.rm_nail_stocks(@nail_item)
  end
end
