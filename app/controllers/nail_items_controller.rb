class NailItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @nail_items = NailItem.includes(:brand, :product, :prod_color)
                          .order(:brand_id, :product_id, :prod_color_id)
  end

  def show
    @nail_item = NailItem.find(params[:id])
  end

  def new
    @nail_item = NailItem.new
  end

  def create
    @nail_item = NailItem.new
    brand = Brand.find_or_create_by(name: nail_item_params[:brand_name])
    product = Product.find_or_create_by(
              name: nail_item_params[:product_name],
              brand_id: brand.id
            )

    prod_color = ProdColor.find_or_create_by(
              name: nail_item_params[:prod_color_name],
              product_id: product.id
            )
    @nail_item.brand = brand
    @nail_item.product = product
    @nail_item.prod_color = prod_color

    if @nail_item.save
      redirect_to new_nail_item_path, notice: "登録されました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity # エラー時にステータスコード422を返す
    end
  end

  # nail_items登録時オートコンプリート用
  def brands_search
    @brands = Brand.where("name LIKE ?", "%#{params[:query]}%").limit(10)
    render partial: "brands_search", layout: false
  end

  def products_search
    @products = Product.where("name LIKE ?", "%#{params[:query]}%").limit(15)
    render partial: "products_search", layout: false
  end

  def prod_colors_search
    @prod_colors = ProdColor.where("name LIKE ?", "%#{params[:query]}%").limit(15)
    render partial: "prod_colors_search", layout: false
  end
  # /nail_items登録時オートコンプリート用ここまで

  def nail_stocks
    @item_stocks = current_user.item_stocks.includes(:brand, :product, :prod_color)
                                          .order(:brand_id, :product_id, :prod_color_id)
  end

  private

  def nail_item_params
    params.require(:nail_item).permit(:brand_name, :product_name, :prod_color_name)
  end
end
