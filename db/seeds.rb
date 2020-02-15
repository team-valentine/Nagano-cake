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

Admin.create!(email: 'test@test', password: 'testtest')

Customer.create(lastname: 'test', email: 'test@test', password: 'testtest')

Item.create(genre_id: 1, name: '美味しいケーキ', description: '美味しいです', tax_excluded_price: '800', status: 1)

Delivery.create(postal_code: '1111', address: 'tokyo', name: 'taro yamada')

Order.create(customer_id: 1, shipping_fee: '800', billing_amount: '3000', payment_method: 'クレジットカード', postal_code: '1111111', address: '沖縄', name: '太郎', status: 1)
