class NailStocksController < ApplicationController
  def create
    @nail_item = current_user.nail_stocks.new(nail_stock_params)
    current_user.add_nailstock(@nail_item)
  end

  def destroy
    @nail_item = current_user.nail_stocks.find(params[:id])
    current_user.rm_nailstock(@nail_item)
  end
