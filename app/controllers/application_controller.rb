class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	protected
	def configure_account_update_params
		devise_parameter_sanitizer.permit(:account_update, keys:[:name, :introduction, :image, :password, :password_confirmation])
	end

	private

	def after_sign_in_path_for(resource)
		root_path
	end

	def after_sign_up_path_for(resource)
		root_path
	end
end
