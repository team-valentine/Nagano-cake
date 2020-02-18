class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.with_deleted.page(params[:page]).per(10)
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to admins_customer_path
  end

  private
  def customer_params
  	params.require(:customer).permit(:lastname,:firstname,:kana_lastname,:kana_firstname,:postal_code,:address,:phone_number,:email, :status)


  end

end
