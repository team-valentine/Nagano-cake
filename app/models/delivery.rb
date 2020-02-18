class Delivery < ApplicationRecord
	belongs_to :customer, optional: true
	belongs_to :orders, optional: true

	def view_name_and_id
		self.postal_code + ' ' + self.address + ' ' + self.name
	end
end
