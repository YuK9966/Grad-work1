class Nailstock < ApplicationRecord
  belongs_to :user
  belongs_to :nail_item
end
