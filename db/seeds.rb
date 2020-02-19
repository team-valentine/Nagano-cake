# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(name: 'ケーキ', status: 'true')
Genre.create(name: '焼き菓子', status: 'true')
Genre.create(name: 'プリン', status: 'true')
Genre.create(name: 'キャンディ', status: 'true')
Genre.create(name: 'マカロン', status: 'true')

Admin.create!(email: 'test@test', password: 'testtest')

Customer.create(lastname: 'テスト', firstname: '太郎', kana_lastname: 'テスト', kana_firstname: 'タロウ', postal_code: '3333333', address: '東京都江戸川区３３３', phone_number: '080-0000-0000', email: 'test@test', password: 'testtest', status: true)

Item.create(genre_id: 1, name: '美味しいケーキ', description: '美味しいケーキです', tax_excluded_price: '800', status: 1)
Item.create(genre_id: 2, name: '楽しい焼き菓子', description: '楽しい焼き菓子です', tax_excluded_price: '500', status: 1)
Item.create(genre_id: 3, name: 'とろけるプリン', description: 'とろけるプリンです', tax_excluded_price: '300', status: 1)
Item.create(genre_id: 4, name: 'キャンディ', description: 'キャンディです', tax_excluded_price: '100', status: 1)
Item.create(genre_id: 4, name: 'すごいマカロン', description: 'すごいマカロンです', tax_excluded_price: '100', status: 1)

Delivery.create(customer_id: 1, postal_code: '5555555', address: '沖縄県那覇市', name: 'テスト太郎の祖父')

