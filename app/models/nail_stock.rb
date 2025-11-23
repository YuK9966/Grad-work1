class NailStock < ApplicationRecord
  belongs_to :nail_item
  belongs_to :user
end
