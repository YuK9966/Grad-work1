class Naillog < ApplicationRecord
  belongs_to :user
  has_many :log_colors, dependent: :destroy
  has_many :log_nails, dependent: :destroy
  has_many :colors, through: :log_colors
  has_many :nail_items, through: :log_nails
  has_many :log_images, dependent: :destroy
  accepts_nested_attributes_for :log_images, allow_destroy: true
  mount_uploader :main_image, MainImageUploader

  validates :title, presence: true
  validates :status, presence: true
end
