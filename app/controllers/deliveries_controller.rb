class DeliveriesController < ApplicationController
before_action :authenticate_customer!
  def index
  	@delivery = Delivery.new
    @deliveries = current_customer.deliveries.reverse_order
  end

  def create
  	delivery = Delivery.new(delivery_params)
  	if delivery.save
      flash[:delivery_success] = "配送先が登録されました。"
      redirect_to deliveries_path
    else
      flash[:delivery_error] = "配送先が空欄です。"
      redirect_to deliveries_path
    end

  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    delivery = Delivery.find(params[:id])
    if delivery.update(delivery_params)
      flash[:delivery_edit] = "配送先が編集されました。"
      redirect_to deliveries_path
    else
      flash[:delivery_error] = "配送先が空欄です。"
      redirect_to edit_delivery_path(delivery)
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    flash[:delivery_delete] = "配送先が削除されました。"
    redirect_to deliveries_path
  end

  private
  def delivery_params
  	params.require(:delivery).permit(:customer_id, :postal_code, :address, :name)
  end

end
