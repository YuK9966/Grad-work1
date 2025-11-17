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

Naillog.create!(
  title: '初めてのネイルログ',
  body: 'これは私の最初のネイルログです！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id
)

Naillog.create!(
  title: 'にこめのネイルログ',
  body: '１のネイルログです！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id
)

Naillog.create!(
  title: '3こめのネイルログ',
  body: '3こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id
)

Naillog.create!(
  title: '4こめのネイルログ',
  body: '4こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id
)

Naillog.create!(
  title: '5こめのネイルログ',
  body: '5こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id
)

Naillog.create!(
  title: '6こめのネイルログ',
  body: '6こめ！',
  nailed_date: Date.today,
  design_url: 'https://example.com/design1',
  user_id: User.first.id
)
