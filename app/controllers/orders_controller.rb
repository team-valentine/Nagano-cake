class OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirm
    @order=Order.new
  end

  def complete
  end

  def index
  end

  def show
  end

end
