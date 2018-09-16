class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_params, if: :devise_controller?

	protected
	def configure_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :fotoProfilo, :descrizione, :password, :password_confirmation])
	end

    def redirect_if_not_signed_in
      redirect_to root_path if !user_signed_in?
    end

    def redirect_if_signed_in
      redirect_to root_path if user_signed_in?
    end

end
