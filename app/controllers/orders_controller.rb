class OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm
    @order=Order.new
    @cart_item=CartItem.new
    @cart_items=CartItem.all
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
    redirect_to orders_confirm_path(@order)
  else
    @customer=current_customer
    render :new
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
  params.require(:order).permit(:lastname,:firstname,:kana_lastname,:kana_firstname,:postal_code,:address,:phone_number,:email, :status)
  end

end
