class Product < ApplicationRecord
  belongs_to :brand
  has_many :prod_colors, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :brand_id }
end
