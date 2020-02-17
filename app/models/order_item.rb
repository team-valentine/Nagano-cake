class OrderItem < ApplicationRecord

	belongs_to :order, optional: true
	belongs_to :item
	enum status: { 着手不可: 1, 制作待ち: 2, 製作中: 3, 制作完了: 4 }

  def price_with_tax
    tax = 1.1
    (tax_excluded_price * tax).floor
  end

end
