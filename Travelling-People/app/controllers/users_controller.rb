class UsersController < ApplicationController

	def search
		#@user = User.find_by(username: params[:user][:username])
		#redirect_to user_path(@user)
	end

	def show
		@user = User.find_by(username: params[:user][:username])
		if @user.nil?
			flash[:warning] = 'Utente inesistente!'
			redirect_to root_path
		end
	end

end

