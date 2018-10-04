class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id).order('username')
  end

  def search
    name = params[:username]
    @user = User.find_by(username: name)
    if @user.nil?
      flash[:warning] = 'Utente non trovato'
      redirect_to root_path
    else
      redirect_to user_path(@user.id)
    end
  end

  def show
    #	@user = User.find_by(username: params[:user][:username])
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: params[:id])
    if @user.nil?
      flash[:warning] = 'Utente inesistente!'
      redirect_to root_path
    else
      @reports = @user.reports
    end
  end

  def destroy
    @user = User.find(params[:id])
    User.destroy(@user.id)
    flash[:success] = 'Utente eliminato!'
    redirect_to root_path
  end

end
