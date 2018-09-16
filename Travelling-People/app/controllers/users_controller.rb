class UsersController < ApplicationController

	def index
		@users = User.where.not(id: current_user.id).order('username')
	end

	def search
	end

	def show
		@user = User.find_by(username: params[:user][:username])
		if @user.nil?
			flash[:warning] = 'Utente inesistente!'
			redirect_to root_path
		end
	end

	def destroy
    	@user = User.find(params[:id])
		User.destroy(@user.id)
    	flash[:notice] = 'Utente eliminato!'
    	redirect_to users_path
  	end

end

