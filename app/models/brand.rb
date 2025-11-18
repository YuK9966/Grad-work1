class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :nail_items, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
