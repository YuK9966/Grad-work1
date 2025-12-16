# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
  status: 'published'
)

Naillog.create!(
  title: 'にこめのネイルログ',
  body: '2のネイルログです！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published'
)

Naillog.create!(
  title: '3こめのネイルログ',
  body: '3こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published'
)

Naillog.create!(
  title: '4こめのネイルログ',
  body: '4こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published'
)

Naillog.create!(
  title: '5こめのネイルログ',
  body: '5こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published'
)

Naillog.create!(
  title: '6こめのネイルログ',
  body: '6こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'published'
)

Naillog.create!(
  title: 'ネイルログ7',
  body: 'ななこめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: user2.id,
  status: 'published'
)

Naillog.create!(
  title: '8こめのネイルログ　ユクリ下書き',
  body: '8こめ！したがき',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: user2.id,
  status: 'draft'
)

Naillog.create!(
  title: '9こめのネイルログ　ゆっくり下書き',
  body: '9こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id,
  status: 'draft'
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

p "create done"
