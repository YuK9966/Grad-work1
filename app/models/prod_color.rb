class ProdColor < ApplicationRecord
  belongs_to :product
  has_many :nail_items, dependent: :destroy

  validates :name, presence: true
  validates :product_id, presence: true
  validates :name, uniqueness: { scope: :product_id }
end
