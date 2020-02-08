class CustomersController < ApplicationController
  def top
  end

  def about
  end

  def cancel_registrations
  end

  def show
  	  @customer =Customer.find(params[:id])
  end

   private
  def customer_params
  	  params.require(:customer).permit(:lastname, :firstname, :kana_astname, :kana_firstname, :postal_code, :address, :phone_number, :email, :status)
  end
end
