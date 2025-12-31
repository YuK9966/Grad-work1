class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :normalize_started_nail_on
  has_many :nail_stocks, dependent: :destroy # 中間テーブルとのアソシエーション
  has_many :nail_items, through: :nail_stocks
  has_many :item_stocks, through: :nail_stocks, source: :nail_item # item_stocksメソッドを定義。nail_stocksを中間テーブルとして、nail_itemsを取得
  has_many :naillogs, dependent: :destroy

  validates :nickname, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def own?(record)
    record.respond_to?(:user_id) && record.user_id == id
  end

  # NailItemをユーザーのNail_stocksに追加するメソッド
  def add_nail_stocks(nail_item)
    item_stocks << nail_item
  end

  # NailItemをユーザーのNail_stocksから削除するメソッド
  def rm_nail_stocks(nail_item)
    item_stocks.destroy(nail_item)
  end

  # ユーザーのNail_stocksに、特定のNailItemが登録されているか確認するメソッド
  def nail_stocked?(nail_item)
    item_stocks.include?(nail_item)
  end

  # ネイルを始めた年月をDate型に正規化する
  def normalize_started_nail_on
    return if started_nail_on.blank?

    if started_nail_on.is_a?(String)
      self.started_nail_on = Date.parse("#{started_nail_on}-01")
    end
  end
end
