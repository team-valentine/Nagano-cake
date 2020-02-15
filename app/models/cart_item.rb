class CartItem < ApplicationRecord
	belongs_to :customer, optional: true
	belongs_to :item, optional: true

    validates :quantity, numericality:{only_integer:true, greater_than_or_equal_to:0}
end
