class Delivery < ApplicationRecord
	belongs_to :customer, optional: true
	belongs_to :orders, optional: true
end
