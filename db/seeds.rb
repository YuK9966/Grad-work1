# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# load(Rails.root.join("db", "seeds", "#{Rails.env.downcase}.rb"))

p "create Users"
User.create!(
  email: 'user1@exam.com',
  password: 'aaaaaaaa',
  nickname: 'ゆっくり',
)

user2 = User.create!(
  email: 'user2@exam.com',
  password: 'aaaaaaaa',
  nickname: 'ユクリ',
)

p "create Naillog start"
Naillog.create!(
  title: '初めてのネイルログ',
  body: 'これは私の最初のネイルログです！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: 'にこめのネイルログ',
  body: '2のネイルログです！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: '3こめのネイルログ',
  body: '3こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: '4こめのネイルログ',
  body: '4こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: '5こめのネイルログ',
  body: '5こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: '6こめのネイルログ',
  body: '6こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published',
  nail_shape: 'オーバル'
)

naillogs7 = Naillog.create!(
  title: 'ネイルログ7',
  body: 'ななこめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: user2.id,
  status: 'published',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: '8こめのネイルログ　ユクリ下書き',
  body: '8こめ！したがき',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: user2.id,
  status: 'draft',
  nail_shape: 'オーバル'
)

Naillog.create!(
  title: '9こめのネイルログ　ゆっくり下書き',
  body: '9こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'draft',
  nail_shape: 'オーバル'
)

p "create Naillogs done"

# NailItems生成
p "create NailItems"
brand = Brand.create!(
  name: "ネイル工房"
)

product = Product.create!(
  brand_id: brand.id,
  name: "フルーツマグネット"
)

prod_color1 = ProdColor.create!(
  product_id: product.id,
  name: "01 onion"
)

prod_color2 = ProdColor.create!(
  product_id: product.id,
  name: "02 lemon"
)

nailitem1 = NailItem.create!(
  brand_id: brand.id,
  product_id: product.id,
  prod_color_id: prod_color1.id
)
nailitem2 = NailItem.create!(
  brand_id: brand.id,
  product_id: product.id,
  prod_color_id: prod_color2.id
)

brand2 = Brand.create!(
  name: "Coikaze"
)
product2 = Product.create!(
  brand_id: brand2.id,
  name: "ゴールドマグネット"
)

prod_color3 = ProdColor.create!(
  product_id: product2.id,
  name: "MG27 シャンペン"
)
prod_color4 = ProdColor.create!(
  product_id: product2.id,
  name: "MG28 ピンクビーチ"
)

product3 = Product.create!(
  brand_id: brand2.id,
  name: "フラッシュマグネット"
)
prod_color5 = ProdColor.create!(
  product_id: product3.id,
  name: "MG26 ライラック"
)

nailitem3 = NailItem.create!(
  brand_id: brand2.id,
  product_id: product2.id,
  prod_color_id: prod_color3.id
)
nailitem4 = NailItem.create!(
  brand_id: brand2.id,
  product_id: product3.id,
  prod_color_id: prod_color5.id
)

# NailStocks生成
p "create NailStocks check point1"
NailStock.create!(
  nail_item_id: nailitem1.id,
  user_id: User.first.id
)
NailStock.create!(
  nail_item_id: nailitem2.id,
  user_id: User.first.id
)
NailStock.create!(
  nail_item_id: nailitem3.id,
  user_id: User.first.id
)
p "create nailstocks"

# log_nails 中間テーブル生成
LogNail.create!(
nail_item_id: nailitem3.id,
naillog_id: naillogs7.id
)

LogNail.create!(
nail_item_id: nailitem1.id,
naillog_id: naillogs7.id
)

# 色データ生成
p "create Colors"
Color.create!(
  name: "赤系",
  color_code: "#C83635"
)

Color.create!(
  name: "ピンク系",
  color_code: "#EC74A3"
)

Color.create!(
  name: "水色系",
  color_code: "#90D1E0"
)

Color.create!(
  name: "オレンジ系",
  color_code: "#E07A3A"
)

Color.create!(
  name: "黄色系",
  color_code: "#E6C63A"
)

Color.create!(
  name: "黄緑系",
  color_code: "#9EC63F"
)

Color.create!(
  name: "緑系",
  color_code: "#4FA46A"
)

Color.create!(
  name: "青系",
  color_code: "#4A86C5"
)

Color.create!(
  name: "紫系",
  color_code: "#7A63B8"
)

Color.create!(
  name: "白系",
  color_code: "#F5F5F5"
)

Color.create!(
  name: "黒系",
  color_code: "#2E2E2E"
)

Color.create!(
  name: "グレー系",
  color_code: "#9E9E9E"
)

Color.create!(
  name: "ベージュ系",
  color_code: "#D2B48C"
)

Color.create!(
  name: "ブラウン系",
  color_code: "#9A6238"
)

Color.create!(
  name: "ネイビー系",
  color_code: "#3F5F8C"
)

Color.create!(
  name: "グレージュ系",
  color_code: "#B8A88C"
)
Color.create!(
  name: "くすみピンク系",
  color_code: "#C97A95"
)

p "seed done"
