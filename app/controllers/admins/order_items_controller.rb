class Admins::OrderItemsController < ApplicationController
  def update
  	order_item = OrderItem.find(params[:id])
 	order_item.update(order_item_params)
 	redirect_to admins_order_path(order_item.order.id)
  end

  private

  def order_item_params
  	params.require(:order_item).permit(:order_id, :item_id, :tax_excluded_price, :quantity, :status)
  end

end
