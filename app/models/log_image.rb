class LogImage < ApplicationRecord
  belongs_to :naillog
  mount_uploader :image_url, LogImageUploader
  validates :image_url, presence: true, uniqueness: true
end
