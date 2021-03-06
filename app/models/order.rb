class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :customer
	has_many :deliveries
	enum payment_method:{クレジットカード: 1, 銀行振込: 2}
	enum status:{入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5}
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :name, presence: true

	def shipping_fee
	  800
	end

	def quantity_sum(order_id)
		quantity_sum = Order.find(order_id).order_items.map{|q| q.quantity}.sum
	end




end
