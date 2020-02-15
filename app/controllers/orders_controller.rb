class OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

def confirm
    @customer=current_customer
    @order=Order.new(order_params)
    @cart_item=CartItem.new
    @cart_items=CartItem.all
    if params[:selected_address]== 'customer'
    ## 自身の住所の処理
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.postal_code = current_customer.postal_code
    @order.lastname = current_customer.lastname
    @order.firstname = current_customer.firstname

    elsif params[:selected_address]== 'deliveries'
    ## 選択された住所の処理
    @order.postal_code = Delivery.postal_code

    @order.address = Order.deliveries.address
    @order.address = Order.deliveries.name

    else params[:selected_address]== 'new_deliveries'
    ## 新しい住所の処理
    # @order.postal_code = Order.postal_code.new
    @order_new= Order.new
    #@order.address = new_deliveries.address
    end

end

def create
end

def complete

end

def index
end

def show
end

private
def order_params
  params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :payment_method, :postal_code, :address, :name, :status)
end



end
