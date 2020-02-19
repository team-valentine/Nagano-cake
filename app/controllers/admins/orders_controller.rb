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

    if order.status == '入金確認'
      order.order_items.update(status: '制作待ち')
    elsif order.status == '発送済み'
      order.order_items.update(status: '制作完了')
    end

  	redirect_to admins_order_path
  end

  private

  def order_params
  params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :payment_method, :postal_code, :address, :name, :status)
  end

end
