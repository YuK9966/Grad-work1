class Naillog < ApplicationRecord
  attr_accessor :brand_id, :product_id, :prod_color_id
  scope :published, -> { where(status: "published") }

  belongs_to :user
  has_many :log_colors, dependent: :destroy
  has_many :log_nails, dependent: :destroy
  has_many :colors, through: :log_colors
  has_many :nail_items, through: :log_nails
  accepts_nested_attributes_for :log_nails, allow_destroy: true
  has_many :log_images, dependent: :destroy
  accepts_nested_attributes_for :log_images, allow_destroy: true
  mount_uploader :main_image, MainImageUploader

  validates :title, presence: true
  validates :status, presence: true
end
