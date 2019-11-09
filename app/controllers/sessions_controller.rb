class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  def new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else

      redirect_to signin_path
    end
  end

  def index
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
