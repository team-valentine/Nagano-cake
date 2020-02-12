class ApplicationController < ActionController::Base
	def after_sign_up_path_for(resource)
		if resource.class == Customer
			root_path
		elsif resource.class == Admin
			admins_top_path
		end
	end

   def after_sign_in_path_for(resource)
		if resource.class == Customer
			root_path
		elsif resource.class == Admin
			admins_top_path
		end
	end

	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :kana_lastname, :kana_firstname, :postal_code, :address, :phone_number])
		devise_parameter_sanitizer.permit(:account_update, keys: [:lastname, :firstname, :kana_lastname, :kana_firstname, :postal_code, :address, :phone_number])
	end
end
# 	  private
#   def customer_params
#       params.require(:customer).permit(:lastname, :firstname, :kana_astname, :kana_firstname, :postal_code, :address, :phone_number, :email, :status)
#   end
#   protected
#   # 追記する
#   # 追記する
#   def update_resource(resource, params)
#     resource.update_without_password(params)
#   end
# end


# end


#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
#     devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    
#   end