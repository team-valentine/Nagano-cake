class Admins::CustomersController < ApplicationController
before_action :authenticate_admin!
  def index
    @customers = Customer.with_deleted.page(params[:page]).per(10)
  end

  def show
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def edit
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def update
  	@customer = Customer.with_deleted.find(params[:id])
    if @customer.update(customer_params)
      flash[:customer_success] = "会員情報が編集されました。"

      if @customer.status == false
        @customer.destroy
        redirect_to admins_customer_path
      elsif  @customer.status == true
        @customer.restore
        redirect_to admins_customer_path
      end

    else
      flash[:customer_error] = "空欄があります。"
      redirect_to edit_admins_customer_path

    end

  end

  private
  def customer_params
  	params.require(:customer).permit(:lastname,:firstname,:kana_lastname,:kana_firstname,:postal_code,:address,:phone_number,:email, :status)
  end
end