class SessionsController  < ApplicationController
  include UsersHelper
  include ApplicationHelper
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path, alert: 'Something went wrong'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end