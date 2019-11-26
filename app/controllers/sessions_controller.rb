class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Wrong Username or Password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
