class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :customer
	has_many :deliveries
	enum payment_method:{クレジットカード: 1, 銀行振込: 2}
end
