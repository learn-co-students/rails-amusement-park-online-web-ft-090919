class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete]
  skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :tickets, :password, :happiness, :nausea, :height, :admin)
  end


end
