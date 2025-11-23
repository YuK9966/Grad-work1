class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :nail_stocks, dependent: :destroy
  has_many :nail_items, through: :nail_stocks
  has_many :naillogs, dependent: :destroy

  validates :nickname, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
