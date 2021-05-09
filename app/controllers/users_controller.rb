class UsersController < ApplicationController
include UsersHelper
include ApplicationHelper
before_action :require_login, only: [:show]


  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)
    if !@user.valid?
      render 'new'
    else
      @user.save
      redirect_to login_path
    end
    
    
  end

  def show
    @user = current_user
    redirect_to login_path if !@user
  end


  private

  def strong_params
    params.required(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
