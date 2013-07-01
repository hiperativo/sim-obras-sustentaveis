class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :super_admin?

	def super_admin?
		current_admin.role == "administrador"
	end

	def autenticar_super_admin?
		unless super_admin?
			flash[:error] = "Você não está autorizado." 
			redirect_to "/"
		end
	end

	def log(admin, action, details)
		Log.create(admin_id: admin.id, action: action, details: details)
	end

	private

end
