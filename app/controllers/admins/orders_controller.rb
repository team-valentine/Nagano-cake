class Admins::OrdersController < ApplicationController
before_action :authenticate_admin!
  def index
  	@orders = Order.page(params[:page]).per(10)
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items.all
  end


  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	redirect_to admins_order_path
  end

  private

  def order_params
  params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :payment_method, :postal_code, :address, :name, :status)
  end


end
