class AddSelectedOrderToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :SelectedOrder, :string
  end
end
