class OmniauthCallbacksController < ApplicationController

	def google_oauth2
	    user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			sign_in_and_redirect user, :event => :authentication
		    ### flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
		else
			session["devise.google_data"] = request.env["omniauth.auth"]
	    	redirect_to new_user_registration_path, alert: user.errors.full_messages
	    end
	end

	def failure
	 	redirect_to root_path
	end

end


