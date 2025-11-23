class NailItem < ApplicationRecord
  belongs_to :brand
  belongs_to :product
  belongs_to :prod_color
  has_many :log_nails, dependent: :destroy
  has_many :naillogs, through: :log_nails
  has_many :nailstocks, dependent: :destroy


  validates :brand_id, presence: true
  validates :product_id, presence: true
  validates :prod_color_id, presence: true

    # 複合ユニークバリデーション
  validate :unique_combination

  def unique_combination
    if NailItem.exists?(brand_id:, product_id:, prod_color_id:)
      errors.add(:base, "このアイテムは既に登録されています")
    end
  end
end
