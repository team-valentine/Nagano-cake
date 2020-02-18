class CustomersController < ApplicationController


  before_action :authenticate_customer!, except: [:top, :about]

  def top
  end

  def about
  end

  def cancel_registrations
    @customer = current_customer
  end

  def show
  	@customer =Customer.find(params[:id])
  end

  def edit
    @customer =Customer.find(params[:id])
  end

  def update
    @customer =Customer.find(params[:id])
    @customer.update(customer_params)
  end

    def destroy
    customer =Customer.find(params[:id])
    customer.update(customer_status_params)
    customer.destroy
    redirect_to root_path
  end

   private
  def customer_params
  	params.require(:customer).permit(:lastname, :firstname, :kana_astname, :kana_firstname, :postal_code, :address, :phone_number, :email, :status)
  end

  def customer_status_params
    params.require(:customer).permit(:status)
  end
end
