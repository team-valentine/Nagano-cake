class Admins::OrderItemsController < ApplicationController
before_action :authenticate_admin!
  def update
  	order_item = OrderItem.find(params[:id])
 	order_item.update(order_item_params)
 	order_items = OrderItem.find(params[:id]).order.order_items


  if order_item.status == '製作中'
      order_item.order.update(status: '製作中')
   elsif  order_items.map{|n| n.status}.all? {|n| n == "制作完了" }
   		order_item.order.update(status: '発送済み')
    end
 	redirect_to admins_order_path(order_item.order.id)
  end

  private

  def order_item_params
  	params.require(:order_item).permit(:order_id, :item_id, :tax_excluded_price, :quantity, :status)
  end

end
