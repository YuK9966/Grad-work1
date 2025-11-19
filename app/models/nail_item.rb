class NailItem < ApplicationRecord
  belongs_to :brand
  belongs_to :product
  belongs_to :prod_color
  has_many :log_nails, dependent: :destroy
  has_many :naillogs, through: :log_nails
  has_many :nailstocks, dependent: :destroy

    # 複合ユニークバリデーション
  validates :brand_id, uniqueness: { 
    scope: [:product_id, :prod_color_id],
    message: "このアイテムは既に登録されています"
}

# クラスメソッドとして定義
  def self.create_with_associations(nail_item_params)
    ActiveRecord::Base.transaction do
      # 1. 関連レコードを検索・作成
      brand = Brand.find_or_create_by(name: nail_item_params[:brand_name])
      
      product = Product.find_or_create_by(
        name: nail_item_params[:product_name],
        brand_id: brand.id
      )
      
      prod_color = ProdColor.find_or_create_by(
        name: nail_item_params[:prod_color_name],
        product_id: product.id
      )
      # 2. NailItemレコードを作成・保存して返す
      create!(
        brand_id: brand.id,
        product_id: product.id,
        prod_color_id: prod_color.id
      )
    end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error "商品登録エラー: #{e.message}"
    nil
  end
end
