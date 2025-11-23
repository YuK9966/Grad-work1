class NailStock < ApplicationRecord
  belongs_to :user
  belongs_to :nail_item

  validates :user_id, uniqueness: { scope: :nail_item_id }
end
