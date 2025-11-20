class NailItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @nail_item = NailItem.new
  end

  def create
    @nail_item = NailItem.create_with_associations(nail_item_params)
    if @nail_item
      redirect_to @nail_item, notice: '登録されました'
    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:alert] = 'この組み合わせは既に存在します'
      render :new
  end
  
  def brands_search
    @brands = Brand.where("name LIKE ?", "%#{params[:query]}%").order(:name).limit(10)
    render "brands_search"
  end

  def products_search
    @products = Product.where("name LIKE ?", "%#{params[:query]}%").order(:name)
    render "products_search"
  end

  def prod_colors_search
    @prod_colors = ProdColor.where("name LIKE ?", "%#{params[:query]}%").order(:name)
    render "prod_colors_search"
  end

  private
  
  def nail_item_params
    params.require(:nail_item).permit(:brand_name, :product_name, :prod_color_name)
  end
end
