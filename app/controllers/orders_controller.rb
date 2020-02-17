class OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

def confirm
    @customer=current_customer
    # @order=Order.new(order_params)
    @cart_item=CartItem.new
    @cart_items=CartItem.all
    @order= Order.new
    if params[:selected_address]== 'customer'
    ## 自身の住所の処理
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.lastname + current_customer.firstname
        @order.status = 1

    elsif params[:selected_address]== 'deliveries'
    ## 選択された住所の処理
     @delivery = Delivery.find(params[:sub_address])


    else params[:selected_address]== 'new_deliveries'
    ## 新しい住所の処理
    # @order.postal_code = Order.postal_code.new
    
    @order.status = 1
    #@order.address = new_deliveries.address
    end

end

def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.tax_excluded_price = cart_item.item.tax_excluded_price
        @order_item.quantity = cart_item.quantity
        @order_item.status = 1
        @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
end

def complete

end

def index
end

def show
    @orders = current_customer.orders
    @order = Order.find(params[:id])
end

private
def order_params
  params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :payment_method, :postal_code, :address, :name, :status)
end



end
