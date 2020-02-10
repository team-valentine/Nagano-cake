class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.pagenate :page=>params[:page],  :per_page =>10
  end

  def show
  end
end
