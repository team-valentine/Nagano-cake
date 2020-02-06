class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :billing_amount
      t.integer :payment_method
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :status
      t.timestamps
    end
  end
end
