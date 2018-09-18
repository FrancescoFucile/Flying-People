class RegistrationsController < Devise::RegistrationsController

  def account_update_params
    params.require(:user).permit(:username, :descrizione, :fotoProfilo, :password, :password_confirmation, :current_password)
  end

end
