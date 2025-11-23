class NailItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

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
      redirect_to @nail_item, notice: "登録されました"
    else
      flash.now[:alert] = "登録に失敗しました"
      puts @nail_item.errors.full_messages
      render :new, status: :unprocessable_entity # エラー時にステータスコード422を返す
    end
  end

  def brands_search
    @brands = Brand.where("name LIKE ?", "%#{params[:query]}%").order(:name).limit(10)
    render partial: "brands_search", layout: false
  end

  def products_search
    @products = Product.where("name LIKE ?", "%#{params[:query]}%").order(:name).limit(15)
    render partial: "products_search", layout: false
  end

  def prod_colors_search
    @prod_colors = ProdColor.where("name LIKE ?", "%#{params[:query]}%").order(:name).limit(15)
    render partial: "prod_colors_search", layout: false
  end

  private

  def nail_item_params
    params.require(:nail_item).permit(:brand_name, :product_name, :prod_color_name)
  end
end
