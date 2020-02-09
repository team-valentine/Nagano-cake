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
	end

	


end
