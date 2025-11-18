class Color < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :log_colors, dependent: :destroy
  has_many :naillogs, through: :log_colors
end
