class CartItemsController < ApplicationController
before_action :authenticate_customer!
  def index
  	@cart_item =CartItem.new
    @cart_items = current_customer.cart_items.reverse_order

  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:cart_item_edit] = "カート内商品の数量が変更されました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.each do |item|
      item.destroy
    end
    flash[:cart_item_deleteall] = "カート内の商品が全て削除されました"
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    flash[:cart_item_delete] = "カートの商品が削除されました"
    redirect_to cart_items_path
  end

  def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_items = current_customer.cart_items
      if @cart_items.exists?(item_id: @cart_item.item_id)
      # if @cart_items.exists?
        @cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
        @cart_item_new = CartItem.new(cart_item_params)
        @cart_item.quantity = @cart_item.quantity + @cart_item_new.quantity
        @cart_item.save
      else
        @cart_item.save
      end

      flash[:cart_item_success] = "カートに商品が追加されました"
      redirect_to cart_items_path

  end


  private
  def cart_item_params
  	params.require(:cart_item).permit(:customer_id,:item_id,:quantity)
  end
end


