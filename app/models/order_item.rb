class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :item

  def price_with_tax
    tax = 1.1
    (tax_excluded_price * tax).floor
  end
end
