class SessionsController < ApplicationController

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
end
