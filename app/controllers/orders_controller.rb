class OrdersController < ApplicationController
before_action :authenticate_customer!
  def new
    @order=Order.new
    @customer=current_customer
  end

def confirm
    @customer=current_customer

    @cart_item=CartItem.new
    @cart_items=CartItem.all
    @order= Order.new
    @order.payment_method = params[:payment_method]
    @order.status = 1
     if params[:selected_address]== 'deliveries'
        @delivery = Delivery.find(params[:sub_address])
     elsif params[:selected_address] == 'new_deliveries'
        # 新規の住所を保存
        @new_address = Delivery.new
        @new_address.postal_code = params[:postal_code]
        @new_address.address = params[:address]
        @new_address.name = params[:name]
        @new_address.customer_id = current_customer.id
        if @new_address.save
            flash[:notice] = '新しい配送先が保存されました。'
        else
            redirect_to new_order_path
            flash[:notice] = '配送先が空欄です。'
        end
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
    @orders = current_customer.orders

end

def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
end

private
def order_params
  params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :payment_method, :postal_code, :address, :name, :status)
end


end
