class NailStocksController < ApplicationController
  def create
    @nail_item = NailItem.find(params[:nail_item_id])
    current_user.add_nail_stocks(@nail_item)
    flash.now[:success] = "#{@nail_item.brand.name} #{ @nail_item.product.name } #{ @nail_item.prod_color.name }をあなたのNail Stocksに追加しました"
  end

  def destroy
    @nail_item = current_user.nail_stocks.find(params[:id]).nail_item
    current_user.rm_nail_stocks(@nail_item)
    flash.now[:success] = "#{@nail_item.brand.name} #{ @nail_item.product.name } #{ @nail_item.prod_color.name }をあなたのNail Stocksから削除しました"
  end
end
