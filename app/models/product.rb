class Product < ApplicationRecord
  belongs_to :brand
  has_many :prod_colors, dependent: :destroy
  has_many :nail_items, dependent: :destroy

  validates :name, presence: true
  validates :brand_id, presence: true
  validates :name, uniqueness: { scope: :brand_id }
end
