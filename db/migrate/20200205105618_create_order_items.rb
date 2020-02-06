class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :tax_excluded_price
      t.integer :quantity
      t.integer :status
      t.timestamps
    end
  end
end
