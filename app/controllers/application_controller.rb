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

end
