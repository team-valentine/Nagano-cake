class Item < ApplicationRecord
	has_many :orders, dependent: :destroy
	has_many :order_items, dependent: :destroy
	belongs_to :genre
	enum status: { 販売中: 1, 売切れ: 2 }
	# enum genre_id:[['ケーキ', 1], ['焼き菓子', 2], ['プリン', 3], ['キャンディ', 4]]
    attachment :image

  def price_with_tax
    tax = 1.1
    (tax_excluded_price * tax).floor
  end

end
