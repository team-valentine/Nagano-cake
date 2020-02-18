class Delivery < ApplicationRecord
	belongs_to :customer, optional: true
	belongs_to :orders, optional: true

	validates :postal_code, presence: true
	validates :address, presence: true
	validates :name, presence: true

end
