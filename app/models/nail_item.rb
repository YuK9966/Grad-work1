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
end
