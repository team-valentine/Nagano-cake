class CartItemsController < ApplicationController
  def index
  	@cart_item =CartItem.new
  	@cart_items =CartItem.all
  end

  private
  def cart_item_params
  	params.require(cart_item).permit(:customer,:item,:quantity)
  end

end
