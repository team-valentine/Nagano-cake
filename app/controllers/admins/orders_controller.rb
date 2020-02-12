class Admins::OrdersController < ApplicationController
  def index
	@orders = Order.all.reverse_order
	@orders = OrderItem.all.reverse_order
  end

  def show
  end
end
