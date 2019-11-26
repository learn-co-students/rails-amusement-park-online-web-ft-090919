class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.password = params[:user][:password]
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = user.errors.full_messages
      render 'users#new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to users_path if !@user
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
  end

  def authenticate_user
    unless is_logged_in?
      redirect_to '/'
    end
  end

end
